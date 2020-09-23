Attribute VB_Name = "mdlDistort"

'+--------------------------------------+
'| The function "Distort" mixes the     |
'|pixels in a picture using a mask.     |
'| Use it wherever you want, but please |
'|give me some credit for it ;)         |
'|                                      |
'|(Check the Readme for instructions)   |
'|                                      |
'|Made by Jotaf98 (João F. S. Henriques)|
'|E-mail me at jotaf98@hotmail.com      |
'+--------------------------------------+

Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long) As Long
Public Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long

'+--------------------------------------+
'| The following is the strenght of the |
'|mix effect.                           |
'|                                      |
'| Change it at will, but different     |
'|values (almost) always produce        |
'|completely different patterns!        |
'+--------------------------------------+

Const DstrtStrenght As Byte = 1

Public Sub Distort(Target As Long, Mask As Long, X As Long, Y As Long, Width As Long, Height As Long)
    Randomize Timer
    
    Dim Rnd1 As Long
    Dim Rnd2 As Long
    Dim DstrtX1 As Long
    Dim DstrtY1 As Long
    Dim DstrtX2 As Long
    Dim DstrtY2 As Long
    Dim TempColor0 As Long
    Dim TempColor1 As Long
    Dim TempColor2 As Long
    
    For DstrtX1 = DstrtStrenght To Width - (DstrtStrenght + 1)
        For DstrtY1 = DstrtStrenght To Height - (DstrtStrenght + 1)
            
            TempColor0 = GetPixel(Mask, DstrtX1 - DstrtStrenght, DstrtY1 - DstrtStrenght)
            
            If TempColor0 = 0 Then
                Rnd1 = Rnd * 2
                
                If Rnd1 = 0 Then
                    Rnd2 = Rnd * 3
                    
                    Select Case Rnd2
                    Case Is = 0
                        DstrtX2 = DstrtX1
                        DstrtY2 = DstrtY1 - DstrtStrenght
                    Case Is = 1
                        DstrtX2 = DstrtX1 + DstrtStrenght
                        DstrtY2 = DstrtY1
                    Case Is = 2
                        DstrtX2 = DstrtX1
                        DstrtY2 = DstrtY1 + DstrtStrenght
                    Case Is = 3
                        DstrtX2 = DstrtX1 - DstrtStrenght
                        DstrtY2 = DstrtY1
                    End Select
                    
                    TempColor1 = GetPixel(Target, DstrtX1 + X, DstrtY1 + Y)
                    TempColor2 = GetPixel(Target, DstrtX2 + X, DstrtY2 + Y)
                    
                    SetPixel Target, DstrtX1 + X, DstrtY1 + Y, TempColor2
                    SetPixel Target, DstrtX2 + X, DstrtY2 + Y, TempColor1
                End If
            End If
        Next DstrtY1
    Next DstrtX1
End Sub
