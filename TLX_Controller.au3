#include <MsgBoxConstants.au3>
#Include <GuiSlider.au3>

Const $hotkeyTerminate      = "+{ESC}"  ; Shift + Escape
Const $hotkeyNextImage      = "{RIGHT}" ; Right arrow
Const $hotkeyPrevImage      = "{LEFT}"  ; Left arrow
Const $hotkeyRotateLeft     = "z"       ; Plain lowercase z
Const $hotkeyRotateRight    = "x"       ; Plain lowercase x
Const $hotkeyPicSelected    = "{DOWN}"  ; Down arrow
Const $hotkeyPicNotSelected = "{UP}"    ; Up arrow
Const $hotkeyRedPlus        = "{INS}"   ; Insert
Const $hotkeyRedMinus       = "{DEL}"   ; Delete
Const $hotkeyGreenPlus      = "{HOME}"
Const $hotkeyGreenMinus     = "{END}"
Const $hotkeyBluePlus       = "{PGUP}"  ; Page Up
Const $hotkeyBlueMinus      = "{PGDN}"  ; Page Down
Const $hotkeyBrightPlus     = "u"       ; Plain lowercase u
Const $hotkeyBrightMinus    = "j"       ; Plain lowercase j
Const $hotkeyContrastPlus   = "i"       ; Plain lowercase i ("eye")
Const $hotkeyContrastMinus  = "k"       ; Plain lowercase k
Const $hotkeySharpPlus      = "o"       ; Plain lowercase o ("oh" not number zero)
Const $hotkeySharpMinus     = "l"       ; Plain lowercase l ("ell" not number one)

;; Change adjustment sizes here.
;; The ranges of these slider is 2000 units.
Const $iAdjLg = 100 ; How much is a Large slider adjustment?
Const $iAdjMd =  50 ; How much is a Medium slider adjustment?
Const $iAdjSm =  10 ; How much is a Small slider adjustment?

Const $titleTLX = "TLXClientDemo"
Const $idRotateComboList = 1020
Const $textRotateLeft = "90 Left"
Const $textRotateRight = "90 Right"
Const $textRotate180 = "180"
Const $textRotateMirror = "Mirror"
Const $idRotateButton = 1018

Const $titleColor = "Color Adjustment"
Const $idColorButton = 1074
Const $idColorRedSlider = 1072
Const $instColorRedSlider = 1
Const $idColorGreenSlider = 1076
Const $instColorGreenSlider = 2
Const $idColorBlueSlider = 1078
Const $instColorBlueSlider = 3
Const $idColorBrightSlider = 1080
Const $instColorBrightSlider = 4
Const $idColorContrastSlider = 1082
Const $instColorContrastSlider = 5
Const $idColorSharpSlider = 1083
Const $instColorSharpSlider = 6
Const $idColorOkButton = 1

Const $idPrevButton = 1007
Const $idNextButton = 1006

Const $idPicNotSelectedRadio = 1060
Const $idPicSelectedRadio    = 1061
Const $idPicHiddenRadio      = 1062

; Get necessary handles and ranges for adjustment sliders.
$hColorRedSlider = 0
$aColorRedRange = 0
$hColorGreenSlider = 0
$aColorGreenRange = 0
$hColorBlueSlider = 0
$aColorBlueRange = 0
$hColorBrightSlider = 0
$aColorBrightRange = 0
$hColorContrastSlider = 0
$aColorContrastRange = 0
$hColorSharpSlider = 0
$aColorSharpRange = 0

HotKeySet($hotkeyTerminate, "Terminate") ; Press this key to terminate the controller.
Func Terminate()
    Exit
EndFunc

; Previous / Next image
; Left arrow: Previous
; Right arrow: Next
HotKeySet($hotkeyNextImage, "NextImage")
Func NextImage()
   ControlClick ($titleTLX, "", $idNextButton, "primary")
   closeAdjustmentWindow()
   openAdjustmentWindow()
EndFunc

HotKeySet($hotkeyPrevImage, "PrevImage")
Func PrevImage()
   ControlClick ($titleTLX, "", $idPrevButton, "primary")
   closeAdjustmentWindow()
   openAdjustmentWindow()
EndFunc

; Rotation HotKeys.
; The 'z' key rotates anti-clockwise,
; The 'x' key rotates clockwise.
HotKeySet($hotkeyRotateLeft, RotateLeft)
Func RotateLeft()
   Rotate($textRotateLeft)
EndFunc

HotKeySet($hotkeyRotateRight, RotateRight)
Func RotateRight()
   Rotate($textRotateRight)
EndFunc

; Picture selection HotKeys
; Up arrow:   Selected
; Down arrow: Not selected
HotKeySet($hotkeyPicSelected, "PicSelected")
Func PicSelected()
   ControlClick($titleTLX, "", $idPicSelectedRadio, "primary")
EndFunc

HotKeySet($hotkeyPicNotSelected, "PicNotSelected")
Func PicNotSelected()
   ControlClick($titleTLX, "", $idPicNotSelectedRadio, "primary")
EndFunc

; Color correction HotKeys.
; Color : +, -
; Red   : Insert, Delete
; Green : Home, End
; Blue  : Page Up, Page Down
HotKeySet($hotkeyRedPlus, "RedPlusLarge")
Func RedPlusLarge()
   SetSliderPosRel($hColorRedSlider, $iAdjLg, $aColorRedRange)
EndFunc
HotKeySet("+" & $hotkeyRedPlus, "RedPlusMedium")
Func RedPlusMedium()
   SetSliderPosRel($hColorRedSlider, $iAdjMd, $aColorRedRange)
EndFunc
HotKeySet("^" & $hotkeyRedPlus, "RedPlusSmall")
Func RedPlusSmall()
   SetSliderPosRel($hColorRedSlider, $iAdjSm, $aColorRedRange)
EndFunc

HotKeySet($hotkeyRedMinus, "RedMinusLarge")
Func RedMinusLarge()
   SetSliderPosRel($hColorRedSlider, $iAdjLg * -1, $aColorRedRange)
EndFunc
HotKeySet("+" & $hotkeyRedMinus, "RedMinusMedium")
Func RedMinusMedium()
   SetSliderPosRel($hColorRedSlider, $iAdjMd * -1, $aColorRedRange)
EndFunc
HotKeySet("^" & $hotkeyRedMinus, "RedMinusSmall")
Func RedMinusSmall()
   SetSliderPosRel($hColorRedSlider, $iAdjSm * -1, $aColorRedRange)
EndFunc

HotKeySet($hotkeyGreenPlus, "GreenPlusLarge")
Func GreenPlusLarge()
   SetSliderPosRel($hColorGreenSlider, $iAdjLg, $aColorGreenRange)
EndFunc
HotKeySet("+" & $hotkeyGreenPlus, "GreenPlusMedium")
Func GreenPlusMedium()
   SetSliderPosRel($hColorGreenSlider, $iAdjMd, $aColorGreenRange)
EndFunc
HotKeySet("^" & $hotkeyGreenPlus, "GreenPlusSmall")
Func GreenPlusSmall()
   SetSliderPosRel($hColorGreenSlider, $iAdjSm, $aColorGreenRange)
EndFunc

HotKeySet($hotkeyGreenMinus, "GreenMinusLarge")
Func GreenMinusLarge()
   SetSliderPosRel($hColorGreenSlider, $iAdjLg * -1, $aColorGreenRange)
EndFunc
HotKeySet("+" & $hotkeyGreenMinus, "GreenMinusMedium")
Func GreenMinusMedium()
   SetSliderPosRel($hColorGreenSlider, $iAdjMd * -1, $aColorGreenRange)
EndFunc
HotKeySet("^" & $hotkeyGreenMinus, "GreenMinusSmall")
Func GreenMinusSmall()
   SetSliderPosRel($hColorGreenSlider, $iAdjSm * -1, $aColorGreenRange)
EndFunc

HotKeySet($hotkeyBluePlus, "BluePlusLarge")
Func BluePlusLarge()
   SetSliderPosRel($hColorBlueSlider, $iAdjLg, $aColorBlueRange)
EndFunc
HotKeySet("+" & $hotkeyBluePlus, "BluePlusMedium")
Func BluePlusMedium()
   SetSliderPosRel($hColorBlueSlider, $iAdjMd, $aColorBlueRange)
EndFunc
HotKeySet("^" & $hotkeyBluePlus, "BluePlusSmall")
Func BluePlusSmall()
   SetSliderPosRel($hColorBlueSlider, $iAdjSm, $aColorBlueRange)
EndFunc

HotKeySet($hotkeyBlueMinus, "BlueMinusLarge")
Func BlueMinusLarge()
   SetSliderPosRel($hColorBlueSlider, $iAdjLg * -1, $aColorBlueRange)
EndFunc
HotKeySet("+" & $hotkeyBlueMinus, "BlueMinusMedium")
Func BlueMinusMedium()
   SetSliderPosRel($hColorBlueSlider, $iAdjMd * -1, $aColorBlueRange)
EndFunc
HotKeySet("^" & $hotkeyBlueMinus, "BlueMinusSmall")
Func BlueMinusSmall()
   SetSliderPosRel($hColorBlueSlider, $iAdjSm * -1, $aColorBlueRange)
EndFunc

;Brightness
HotKeySet($hotkeyBrightPlus, "BrightPlusLarge")
Func BrightPlusLarge()
   SetSliderPosRel($hColorBrightSlider, $iAdjLg, $aColorBrightRange)
EndFunc
HotKeySet("+" & $hotkeyBrightPlus, "BrightPlusMedium")
Func BrightPlusMedium()
   SetSliderPosRel($hColorBrightSlider, $iAdjMd, $aColorBrightRange)
EndFunc
HotKeySet("^" & $hotkeyBrightPlus, "BrightPlusSmall")
Func BrightPlusSmall()
   SetSliderPosRel($hColorBrightSlider, $iAdjSm, $aColorBrightRange)
EndFunc

HotKeySet($hotkeyBrightMinus, "BrightMinusLarge")
Func BrightMinusLarge()
   SetSliderPosRel($hColorBrightSlider, $iAdjLg * -1, $aColorBrightRange)
EndFunc
HotKeySet("+" & $hotkeyBrightMinus, "BrightMinusMedium")
Func BrightMinusMedium()
   SetSliderPosRel($hColorBrightSlider, $iAdjMd * -1, $aColorBrightRange)
EndFunc
HotKeySet("^" & $hotkeyBrightMinus, "BrightMinusSmall")
Func BrightMinusSmall()
   SetSliderPosRel($hColorBrightSlider, $iAdjSm * -1, $aColorBrightRange)
EndFunc

;Contrast
HotKeySet($hotkeyContrastPlus, "ContrastPlusLarge")
Func ContrastPlusLarge()
   SetSliderPosRel($hColorContrastSlider, $iAdjLg, $aColorContrastRange)
EndFunc
HotKeySet("+" & $hotkeyContrastPlus, "ContrastPlusMedium")
Func ContrastPlusMedium()
   SetSliderPosRel($hColorContrastSlider, $iAdjMd, $aColorContrastRange)
EndFunc
HotKeySet("^" & $hotkeyContrastPlus, "ContrastPlusSmall")
Func ContrastPlusSmall()
   SetSliderPosRel($hColorContrastSlider, $iAdjSm, $aColorContrastRange)
EndFunc

HotKeySet($hotkeyContrastMinus, "ContrastMinusLarge")
Func ContrastMinusLarge()
   SetSliderPosRel($hColorContrastSlider, $iAdjLg * -1, $aColorContrastRange)
EndFunc
HotKeySet("+" & $hotkeyContrastMinus, "ContrastMinusMedium")
Func ContrastMinusMedium()
   SetSliderPosRel($hColorContrastSlider, $iAdjMd * -1, $aColorContrastRange)
EndFunc
HotKeySet("^" & $hotkeyContrastMinus, "ContrastMinusSmall")
Func ContrastMinusSmall()
   SetSliderPosRel($hColorContrastSlider, $iAdjSm * -1, $aColorContrastRange)
EndFunc

;Sharpness
HotKeySet($hotkeySharpPlus, "SharpPlusLarge")
Func SharpPlusLarge()
   SetSliderPosRel($hColorSharpSlider, $iAdjLg, $aColorSharpRange)
EndFunc
HotKeySet("+" & $hotkeySharpPlus, "SharpPlusMedium")
Func SharpPlusMedium()
   SetSliderPosRel($hColorSharpSlider, $iAdjMd, $aColorSharpRange)
EndFunc
HotKeySet("^" & $hotkeySharpPlus, "SharpPlusSmall")
Func SharpPlusSmall()
   SetSliderPosRel($hColorSharpSlider, $iAdjSm, $aColorSharpRange)
EndFunc

HotKeySet($hotkeySharpMinus, "SharpMinusLarge")
Func SharpMinusLarge()
   SetSliderPosRel($hColorSharpSlider, $iAdjLg * -1, $aColorSharpRange)
EndFunc
HotKeySet("+" & $hotkeySharpMinus, "SharpMinusMedium")
Func SharpMinusMedium()
   SetSliderPosRel($hColorSharpSlider, $iAdjMd * -1, $aColorSharpRange)
EndFunc
HotKeySet("^" & $hotkeySharpMinus, "SharpMinusSmall")
Func SharpMinusSmall()
   SetSliderPosRel($hColorSharpSlider, $iAdjSm * -1, $aColorSharpRange)
EndFunc

Func openAdjustmentWindow()
   If Not WinExists($titleColor) Then
	  ; Make TLX window active.
	  WinActivate($titleTLX)
	  ; Open the Color Adjustment window.
	  ControlClick($titleTLX, "", $idColorButton, "primary")
   Else
	  WinActivate($titleColor)
   EndIf
   WinWaitActive($titleColor)
   ; Move the Color Adjustment window into the upper left corner.
   $posColor = WinGetPos($titleColor)
   If $posColor[0] <> 0 Or $posColor[1] <> 0 Then
	  WinMove($titleColor, "", 0, 0)
   EndIf
   ; Get necessary handles and ranges for adjustment sliders.
   $hColorRedSlider = GetSliderHandle($titleColor, $instColorRedSlider)
   $aColorRedRange = GetSliderRange($hColorRedSlider)
   $hColorGreenSlider = GetSliderHandle($titleColor, $instColorGreenSlider)
   $aColorGreenRange = GetSliderRange($hColorGreenSlider)
   $hColorBlueSlider = GetSliderHandle($titleColor, $instColorBlueSlider)
   $aColorBlueRange = GetSliderRange($hColorBlueSlider)
   $hColorBrightSlider = GetSliderHandle($titleColor, $instColorBrightSlider)
   $aColorBrightRange = GetSliderRange($hColorBrightSlider)
   $hColorContrastSlider = GetSliderHandle($titleColor, $instColorContrastSlider)
   $aColorContrastRange = GetSliderRange($hColorContrastSlider)
   $hColorSharpSlider = GetSliderHandle($titleColor, $instColorSharpSlider)
   $aColorSharpRange = GetSliderRange($hColorSharpSlider)
EndFunc

Func closeAdjustmentWindow()
   If Not WinExists($titleColor) Then
	  Return
   EndIf
   WinActivate($titleColor)
   ControlClick($titleColor, "OK", $idColorOkButton, "primary")
EndFunc

openAdjustmentWindow()


; main() where all the action happens until termination HotKey is pressed.
While 1
   Sleep(50)
WEnd

; Rotate current image ($textRotate...)
Func Rotate($textRotationDirection)
   ControlCommand($titleTLX, "", $idRotateComboList, "SelectString", $textRotationDirection) ; select combobox option
   ControlClick($titleTLX, "", $idRotateButton) ; activate selection
EndFunc

; Set position of a slider, then send an arrow key to trip the signal.
; If you don't fake a bit of user input, the app won't acknowledge the slider position change.
Func SetSliderPosAbs($hSlider, $iPos)
   If $iPos > 0 Then
	  _GUICtrlSlider_SetPos($hSlider, $iPos - 1)
	  ControlSend($titleColor, "", $hSlider, "{RIGHT}")
   Else
	  _GUICtrlSlider_SetPos($hSlider, $iPos)
	  ControlSend($titleColor, "", $hSlider, "{LEFT}")
   EndIf
EndFunc

; Get handle of a msctls_trackbar32 slider by window title and instance number.
Func GetSliderHandle($titleWindow, $instSlider)
   Return ControlGetHandle($titleWindow, "", "[CLASS:msctls_trackbar32;INSTANCE:" & $instSlider & "]")
EndFunc

; Adds $relPos to current position of $hSlider.
Func SetSliderPosRel($hSlider, $relPos, $aRange)
   $curPos = GetSliderPos($hSlider)
   $filteredRelPos = FilterRelPos($relPos, $curPos, $aRange)
   SetSliderPosAbs($hSlider, $filteredRelPos)
EndFunc

; Combines current value and relative adjustment,
; then forces the new value to be inside the given range.
; (Int, Int, Int[2])
Func FilterRelPos($relPos, $curPos, $aRange)
   $newPos = $relPos + $curPos
   If $newPos < $aRange[0] Then
	  return $aRange[0]
   ElseIf $newPos > $aRange[1] Then
	  return $aRange[1]
   Else
	  return $newPos
   EndIf
EndFunc

;; Convenience / sugar

Func GetSliderPos($hSlider)
   Return _GUICtrlSlider_GetPos($hSlider)
EndFunc

Func GetSliderRange($hSlider)
   Return _GUICtrlSlider_GetRange($hSlider)
EndFunc
