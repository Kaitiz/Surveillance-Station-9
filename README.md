## [Surveillance Station 9.1.0-10660](https://archive.synology.com/download/Package/SurveillanceStation)
---
### Task Scheduler
- Control Panel -> Task Scheduler
- Create -> Scheduled Task -> User-defined script
- General: User = root, uncheck Enable
- Task Settings: User-defined script = ...
- OK - OK
- Click and run task.
- Delete this task when you see there are 58 licenses.

---
### A. x86_64 (9.1.0-10660)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-x86_64-9.1.0-10660.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-x86_64/install_license)
```

### B. x86_64_openvino (9.1.0-10660)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-x86_64-9.1.0-10660_openvino.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-x86_64_openvino/install_license)
```

### C. DVA3219 (9.1.0-10660)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.1.0-10660/SurveillanceStation-x86_64-9.1.0-10660_DVA_3219.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-DVA3219/install_license)
```

### D. armada38x (9.0.2-10061)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.0.2-10061/SurveillanceStation-armada38x-9.0.2-10061.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-armada38x/install_license)
```

---
### Remove license
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/license/remove_license)
```
