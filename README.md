## Surveillance Station 9.1.0-10660
---
### Task Scheduler
- Control Panel -> Task Scheduler
- Create -> Scheduled Task -> User-defined script
- General: User = root
- Task Settings: User-defined script = ...
- OK - OK
- Click and run task.
- Delete this task when you see there are 58 licenses.

---
### A. x86_64
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-x86_64-9.1.0-10660.spk
- Script:
```
curl -o /tmp/install_license https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-x86_64/install_license; sh /tmp/install_license
```

### B. x86_64_openvino
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-x86_64-9.1.0-10660_openvino.spk
- Script:
```
curl -o /tmp/install_license https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-x86_64_openvino/install_license; sh /tmp/install_license
```

### C. armada38x
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-armada38x-9.1.0-10660.spk
- Script:
```
curl -o /tmp/install_license https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-armada38x/install_license; sh /tmp/install_license
```

---
### D. Remove license
- Script:
```
curl -o /tmp/remove_license https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/license/remove_license; sh /tmp/remove_license
```
