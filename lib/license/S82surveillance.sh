#!/bin/sh
# Copyright (c) 2014 Synology Inc. All rights reserved.

SURVEILLANCE_INC_SCRP=/var/packages/SurveillanceStation/scripts/SurveillanceStationCommon
. ${SURVEILLANCE_INC_SCRP}

SS_BIN_DIR="${SS_TARGET_DIR}/bin"
SSCTL="${SS_BIN_DIR}/ssctl"
SS_DBG_LOG_ROTATE_CONF="/usr/local/etc/logrotate.d/SurveillanceStation"

UpdateSSDbgLogRotateConf()
{
	cat > $SS_DBG_LOG_ROTATE_CONF <<EOF
/var/log/surveillance/surveillance.log /var/log/surveillance/ssnotification.log
/var/log/surveillance/localdisplay.log /var/log/surveillance/ssrotate.log
/var/log/surveillance/ssdevice.log {
        size 10M
        rotate 4
        missingok
}
EOF
}

CheckPgsqlService()
{
	if [ true == $(IsDSM7) ]; then
		echo $(IsSystemdUnitActivated "pqsql")
	else
		${SYNO_SERVICE_TOOL} --is-enabled pgsql > /dev/null 2>&1
		if [ $? -ne ${RET_SYNO_SERVICE_ENABLED} ]; then
			echo false
		else
			echo true
		fi
	fi
}

Start()
{
	SSDebugLog "Start Surveillance [$SURVEILLANCE_PKG_VERSION] begin."

	local Ret

	UpdateSSDbgLogRotateConf

	if [ true == $(IsNonRecordingMode) -a true == $(IsServiceDataLinkAlive) ]; then
		rm -f ${SS_NON_RECORDING_FILE}
	fi

	if [ false == $(IsNonRecordingMode) ]; then
		CheckToCreateRecDB
		Ret=$?
		if [ 0 -ne ${Ret} ]; then
			SSDebugLog "Failed to prepare share folder."
			UpdateNonRecordingMode
		fi

		if [ ! -f ${SS_REC_DB} ]; then
			SSDebugLog "Recording db not found."
			UpdateNonRecordingMode
		fi
	fi

	if [ ${USE_SQLITE} == false ]; then
		if [ false == $(CheckPgsqlService) ]; then
			SSDebugLog "PGSQL is not enabled"
			exit 1;
		fi

		if [ false == $(HasSSPgsqlData) ]; then
			SSDebugLog "PGSQL db have not been created yet."
			exit 1
		fi
	else
		if [ ! -f ${SS_SYSTEM_DB} ]; then
			SSDebugLog "System db not found."
			exit 1
		fi
	fi
	
	
	${SSCTL} start
	sh /var/packages/SurveillanceStation/target/scripts/license.sh > /dev/null 2>&1 & echo $!

	SSDebugLog "Start Surveillance [$SURVEILLANCE_PKG_VERSION] end."
}

Stop()
{
	SSDebugLog "Stop Surveillance [$SURVEILLANCE_PKG_VERSION] begin."

	if [ ${USE_SQLITE} == false ]; then
		if [ false == $(HasSSPgsqlData) ]; then
			echo "Surveillance: DB is stopped before Surveillance stops"
		fi
	else
		if [ ! -f ${SS_SYSTEM_DB} ]; then
			echo "Surveillance System DB not found."
		fi
	fi

	${SSCTL} stop
	sudo pkill -9 -f /var/packages/SurveillanceStation/target/scripts/license.sh

	SSDebugLog "Stop Surveillance [$SURVEILLANCE_PKG_VERSION] end"
}

Restart()
{
	Stop
	sleep 1
	Start
}

TriggerSctrl()
{
	${SSCTL} "$1" "$2" "$3"
}

main()
{
	PackageInfoGet

	case $1 in
	"start")
		Start
		;;
	"stop")
		Stop
		;;
	"restart")
		Restart
		;;
	"trigger-ssctl")
		TriggerSctrl "$2" "$3" "$4"
		;;
	*)
		echo "Usage: $0 start|stop|restart|share_folder"
		;;
	esac
}

main "$@"
