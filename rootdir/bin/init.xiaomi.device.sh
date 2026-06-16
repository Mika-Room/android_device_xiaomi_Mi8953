#!/vendor/bin/sh

set_acdb_path_props() {
	i=0
	for f in `ls /vendor/etc/acdbdata/${1}/*.*`; do
		setprop "persist.vendor.audio.calfile${i}" "${f}"
		let i+=1
	done
}

case "$(cat /sys/xiaomi-msm8953-mach/codename)" in
	"ysl")
		# Device Info
		setprop ro.vendor.xiaomi.device ysl
		# Audio
		setprop persist.vendor.audio.fluence.speaker true
		setprop persist.vendor.audio.fluence.voicecall true
		setprop persist.vendor.audio.fluence.voicerec false
		set_acdb_path_props ysl
		;;
	"vince")
		# Device Info
		setprop ro.vendor.xiaomi.device vince
		# Audio
		setprop persist.vendor.audio.fluence.speaker true
        setprop persist.vendor.audio.fluence.voicecall true
        setprop persist.vendor.audio.fluence.voicerec false
		set_acdb_path_props vince
		;;
	"mido")
		# Device Info
		setprop ro.vendor.xiaomi.device mido
		# Audio
		setprop persist.vendor.audio.fluence.speaker true
		setprop persist.vendor.audio.fluence.voicecall true
		setprop persist.vendor.audio.fluence.voicerec false
		set_acdb_path_props mido
		;;
esac

exit 0