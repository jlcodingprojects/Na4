#constant exitnow -1
#constant _menu 1
#constant _game 2
#constant _select 3
#constant _next 4
#constant _about 5
#constant _artifacts 6
#constant _settings 7
#constant _tutorial 8

#constant _FRAMETIME=0.016
//#constant _FRAMETIME=0.008

#constant screenWidth 150
#constant screenCenter 75,50
#constant screenCenterX 75
#constant screenCenterY 50
#constant screenHeight 100
#constant screenSize 150,100

#constant _phone 0
#constant _pc 1

#constant _PI 3.14
#constant _Gravity 0.12

#constant w_wall 1
#constant w_dynamic 2
#constant w_static 3
#constant w_spin 4
#constant w_oneway 5
#constant w_door 6
#constant w_laser 7
#constant w_motion 8
#constant w_fan 9
#constant w_teleporter 10
#constant w_magnet 11
#constant w_s_door 12
#constant w_s_laser 13
#constant w_lever 14
#constant w_timer 15

#constant shootSpritePower 3
//#constant w_

#constant pCoor GetPointerX(), GetPointerY()
#constant pwCoor ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY())

#constant sbT (GetScreenBoundsTop())
#constant sbB (GetScreenBoundsBottom())
#constant sbR (GetScreenBoundsRight())
#constant sbL (GetScreenBoundsLeft())
#constant sbH (GetScreenBoundsBottom()-GetScreenBoundsTop())
#constant sbcX (GetScreenBoundsLeft()+((GetScreenBoundsRight()-GetScreenBoundsLeft())/2))
#constant sbW (GetScreenBoundsRight()-GetScreenBoundsLeft())
#constant sbcY (GetScreenBoundsTop()+((GetScreenBoundsBottom()-GetScreenBoundsTop())/2))


#constant red   255,0,0
#constant green 0,255,0
#constant blue  0,0,255
#constant dGrey 20,20,20
#constant lGrey 50,50,50
#constant lBlue 200,200,255
`#constant colour 255,255,255
