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

### B. x86_64_openvino (9.0.2-10061)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.0.2-10061/SurveillanceStation-x86_64-9.0.2-10061_openvino.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-x86_64_openvino/install_license)
```

### C. armada38x (9.0.2-10061)
- Link download: https://global.synologydownload.com/download/Package/spk/SurveillanceStation/9.0.2-10061/SurveillanceStation-armada38x-9.0.2-10061.spk
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/SurveillanceStation-armada38x/install_license)
```

---
### D. Remove license
- Script:
```
bash <(curl -L https://raw.githubusercontent.com/Kaitiz/Surveillance-Station/main/lib/license/remove_license)
```
