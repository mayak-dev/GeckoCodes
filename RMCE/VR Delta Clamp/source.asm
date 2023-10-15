#To be inserted at 80528e00

.equ VR_CHANGE_MIN, -25
.equ VR_CHANGE_MAX, 75

# r0 stores the current VR
# r4 stores the change in VR

cmpwi r4, VR_CHANGE_MIN
bge CHECK_CHANGE_EXCEEDS_MAX
li r4, VR_CHANGE_MIN

CHECK_CHANGE_EXCEEDS_MAX:
	cmpwi r4, VR_CHANGE_MAX
	ble APPLY_CHANGE_IN_VR
	li r4, VR_CHANGE_MAX

APPLY_CHANGE_IN_VR:
	add r0, r0, r4
