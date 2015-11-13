VERSION 5.00
Begin VB.Form frmGrayscale 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Grayscale Conversion Algorithms - www.tannerhelland.com"
   ClientHeight    =   7965
   ClientLeft      =   45
   ClientTop       =   630
   ClientWidth     =   15135
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   531
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1009
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frameShades 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "How many shades of gray? "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   13
      Top             =   5520
      Visible         =   0   'False
      Width           =   2775
      Begin VB.HScrollBar hscrShades 
         Height          =   255
         Left            =   120
         Max             =   256
         Min             =   2
         TabIndex        =   14
         Top             =   480
         Value           =   6
         Width           =   2535
      End
      Begin VB.Label lblShades 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   840
         Width           =   2535
      End
   End
   Begin VB.Frame frameDecompose 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Decompose according to... "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   10
      Top             =   4200
      Visible         =   0   'False
      Width           =   2775
      Begin VB.OptionButton optDecompose 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Maximum values"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   12
         Top             =   720
         Width           =   2535
      End
      Begin VB.OptionButton optDecompose 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Minimum values"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Value           =   -1  'True
         Width           =   2535
      End
   End
   Begin VB.Frame frameChannel 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Select a color channel: "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1575
      Left            =   120
      TabIndex        =   6
      Top             =   2520
      Visible         =   0   'False
      Width           =   2775
      Begin VB.OptionButton optChannel 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Blue"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   2535
      End
      Begin VB.OptionButton optChannel 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Green"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   2535
      End
      Begin VB.OptionButton optChannel 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Red"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Value           =   -1  'True
         Width           =   2535
      End
   End
   Begin VB.ListBox lstFilters 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1710
      Left            =   120
      TabIndex        =   5
      Top             =   600
      Width           =   2775
   End
   Begin VB.CommandButton cmdReset 
      Appearance      =   0  'Flat
      Caption         =   "Show the Original Image"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   7080
      Width           =   2535
   End
   Begin VB.PictureBox picMain 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   3000
      ScaleHeight     =   47
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   87
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin VB.PictureBox picBack 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7530
      Left            =   3000
      Picture         =   "Grayscale.frx":0000
      ScaleHeight     =   500
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   800
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   12030
   End
   Begin VB.Label lblExplanation 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "For a detailed explanation of each algorithm used in this project, please visit tannerhelland.com/grayscale"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   2535
      Left            =   120
      TabIndex        =   16
      Top             =   4320
      Width           =   2775
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Grayscale algorithms: "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   240
      Width           =   1755
   End
   Begin VB.Label lblCopyright 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "The above image (from The Secret of Monkey Island: Special Edition) is ©2009 LucasArts"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   3000
      TabIndex        =   3
      Top             =   7680
      Width           =   12015
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuOpenImage 
         Caption         =   "&Open image"
      End
   End
End
Attribute VB_Name = "frmGrayscale"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Grayscale Image Filters by Tanner Helland (published 2011)
'
'http://www.tannerhelland.com
'
'This project demonstrates seven different methods for converting a full-color image to grayscale. Full
' descriptions of each method (including images) are available at this project's homepage:
'     http://www.tannerhelland.com/grayscale
' ...but I'll provide a brief recap here:
'
' 1) Average method.  This is arguably the simplest way to generate a grayscale image - for each pixel,
'       add together the red, green, and blue values then divide by three.  This is your gray value.
'
' 2) Human-eye correction method.  The human eye does not perceive red, green, and blue light equally.
'       This formula takes that into consideration, weighing each color channel by its approximate cone
'       density in the average human eye.  This routine is more computationally expensive than the Average
'       method, but it generates a much more dynamic image.
'
' 3) Desaturate.  Desaturating an image takes advantage of the ability to treat the (R, G, B) colorspace as
'       a 3-dimensional cube.  Desaturation approximates a luminance value by choosing a corresponding point
'       on the neutral axis of the cube for each pixel.  (The actual formula is (max(R,G,B) + min(R, G, B)) / 2)
'
' 4) Decompose.  Decompose (perhaps better written as de-compose, so it's not confused with the biological
'       process) converts each pixel to gray based on either its minimum or maximum channel value.  As you
'       might expect, a minimum decompose results in a darker image; maximum results in a brighter one.
'
' 5) Single color channel.  A single color channel reduction is actually the fastest way to generate a
'       grayscale image, but because it is unpredictable, it needs to be used as an artistic method instead
'       of a generic one.  As the title suggests, this routine builds a gray image based off a single color
'       channel (red, green, or blue, as specified by the user).
'
' 6) Specific # of shades.  All above methods convert a color image to a grayscale image with values between
'       0 and 255.  It is possible, and occasionally desirable, to reduce an image to a subset of gray values.
'       This routine allows a user to convert an image to any # of shades between 2 (black and white) and 256.
'       Note that specifying 256 will give you an image identical to method #1.
'
' 7) Specific # of shades with error-diffusion dithering.  This method is identical to #6, except it adds
'       dithering capabilities, specifically horizontal error-diffusion dithering.  A nice description of this
'       algorithm can be found at http://en.wikipedia.org/wiki/Error_diffusion
'
'To my knowledge, this is the most complete collection of grayscale conversion algorithms anywhere on the
' Internet.  All algorithms are reasonably optimized; for example, look-up tables are utilized in many of
' the algorithms. Further optimizations could be done, but because the algorithms are already very fast,
' I figured it wasn't worth the obfuscation to optimize beyond what you'll find here.
'
'Enjoy the project, and be sure to let me know if you found the code useful.
'
'Also, if you enjoy free VB game and graphics code, subscribe to my RSS feed at
' http://www.tannerhelland.com/feed/

Option Explicit


'When the program is first loaded, several things needs to happen...
Private Sub Form_Load()

    'First, copy the back buffer onto the front buffer
    Dim fDraw As New FastDrawing
    Dim ImageData() As Byte
    Dim iWidth As Long, iHeight As Long
    iWidth = fDraw.GetImageWidth(Me.picBack)
    iHeight = fDraw.GetImageHeight(Me.picBack)
    picMain.Width = iWidth + 2
    picMain.Height = iHeight + 2
    fDraw.GetImageData2D Me.picBack, ImageData()
    fDraw.SetImageData2D Me.picMain, iWidth, iHeight, ImageData()
    
    'Populate the list box with the various available grayscale conversion algorithms
    lstFilters.AddItem "Average value [(R+G+B) / 3]", 0
    lstFilters.AddItem "Adjusted for the human eye", 1
    lstFilters.AddItem "Desaturate", 2
    lstFilters.AddItem "Decompose", 3
    lstFilters.AddItem "Single color channel", 4
    lstFilters.AddItem "Specific # of shades", 5
    lstFilters.AddItem "Specific # of shades (dithered)", 6
    
    'Start the program with nothing selected yet
    lstFilters.ListIndex = -1
    
End Sub

'Reset the foreground image to look like the original image
Private Sub cmdReset_Click()

    Dim fDraw As New FastDrawing
    Dim ImageData() As Byte
    Dim iWidth As Long, iHeight As Long
    iWidth = fDraw.GetImageWidth(Me.picBack)
    iHeight = fDraw.GetImageHeight(Me.picBack)
    fDraw.GetImageData2D Me.picBack, ImageData()
    fDraw.SetImageData2D Me.picMain, iWidth, iHeight, ImageData()
    
End Sub

'When the # of shades scroll bar is changed, make the associated label display the current value (and redraw the image)
Private Sub hscrShades_Change()
    lblShades.Caption = hscrShades.Value
    If lstFilters.ListIndex = 5 Then
        drawGrayscaleCustomShades picBack, picMain, hscrShades.Value
    Else
        drawGrayscaleCustomShadesDithered picBack, picMain, hscrShades.Value
    End If
End Sub

Private Sub hscrShades_Scroll()
    lblShades.Caption = hscrShades.Value
    If lstFilters.ListIndex = 5 Then
        drawGrayscaleCustomShades picBack, picMain, hscrShades.Value
    Else
        drawGrayscaleCustomShadesDithered picBack, picMain, hscrShades.Value
    End If
End Sub

'When a different grayscale algorithm is selected, activate th erelevant options panel (if any) and deactivate all others
Private Sub lstFilters_Click()

    Select Case lstFilters.ListIndex
    
        'Average method
        Case 0
            frameChannel.Visible = False
            frameDecompose.Visible = False
            frameShades.Visible = False
            drawGrayscaleAverageMethod picBack, picMain
            
        'Adjusted to match cone density of the human eye
        Case 1
            frameChannel.Visible = False
            frameDecompose.Visible = False
            frameShades.Visible = False
            drawGrayscaleHumanMethod picBack, picMain
            
        'Desaturate
        Case 2
            frameChannel.Visible = False
            frameDecompose.Visible = False
            frameShades.Visible = False
            drawDesaturate picBack, picMain
            
        'Decompose (high or low)
        Case 3
            frameChannel.Visible = False
            frameDecompose.Visible = True
            frameDecompose.Top = 168
            frameShades.Visible = False
            drawGrayscaleDecompose picBack, picMain, optDecompose(0).Value
            
        'Single color channel (user-selectable between red, green, and blue)
        Case 4
            frameDecompose.Visible = False
            frameChannel.Visible = True
            frameChannel.Top = 168
            frameShades.Visible = False
            If optChannel.Item(0) = True Then
                drawGrayscaleSingleChannel picBack, picMain, 0
            ElseIf optChannel.Item(1) = True Then
                drawGrayscaleSingleChannel picBack, picMain, 1
            Else
                drawGrayscaleSingleChannel picBack, picMain, 2
            End If
            
        'Specific # of shades of gray (3-255)
        Case 5
            frameChannel.Visible = False
            frameDecompose.Visible = False
            frameShades.Visible = True
            frameShades.Top = 168
            drawGrayscaleCustomShades picBack, picMain, hscrShades.Value
            
        'Specific # of shades of gray (3-255) WITH dithering
        Case 6
            frameChannel.Visible = False
            frameDecompose.Visible = False
            frameShades.Visible = True
            frameShades.Top = 168
            drawGrayscaleCustomShadesDithered picBack, picMain, hscrShades.Value
            
    End Select

End Sub

'To load a new image...
Private Sub MnuOpenImage_Click()

    'Common dialog interface
    Dim CC As cCommonDialog
    Set CC = New cCommonDialog
    
    'String returned from the common dialog wrapper
    Dim sFile As String
    
    'This string contains the filters for loading different kinds of images.  Using
    'this feature correctly makes our common dialog box a LOT more pleasant to use.
    Dim cdfStr As String
    cdfStr = "All Compatible Graphics|*.bmp;*.jpg;*.jpeg;*.gif;*.wmf;*.emf;*.dib;*.rle|"
    cdfStr = cdfStr & "BMP - Windows Bitmaps only (non-OS2)|*.bmp|DIB - Windows DIBs only (non-OS2)|*.dib|EMF - Enhanced Meta File|*.emf|GIF - Compuserve|*.gif|JPG - JPEG - JFIF Compliant|*.jpg;*.jpeg|RLE - Windows only (non-Compuserve)|*.rle|WMF - Windows Meta File|*.wmf|All files|*.*"
    
    'If cancel isn't selected, load a picture from the user-specified file
    If CC.VBGetOpenFileName(sFile, , , , , True, cdfStr, 1, , "Open an image", , Me.hWnd, 0) Then
        picBack.Picture = LoadPicture(sFile)
        
        'As requested by Herman CK, warn the user if the image is 3+ megs
        If (picBack.ScaleWidth * picBack.ScaleHeight) > 3000000 Then MsgBox "Warning: this image is big!  This demo was not intended for very large images, and may not perform as expected.", vbCritical + vbOKOnly, "Warning: Large Image"
        
        'This will copy the image, automatically resized, from the background
        'picture box to the foreground one
        Dim fDraw As New FastDrawing
        Dim ImageData() As Byte
        Dim iWidth As Long, iHeight As Long
        iWidth = fDraw.GetImageWidth(Me.picBack)
        iHeight = fDraw.GetImageHeight(Me.picBack)
        fDraw.GetImageData2D Me.picBack, ImageData()
        fDraw.SetImageData2D Me.picMain, iWidth, iHeight, ImageData()
        
        'Hide the (now irrelevant) picture copyright label
        lblCopyright.Visible = False
        
        'De-select all of the current grayscale methods
        lstFilters.ListIndex = -1
        frameChannel.Visible = False
        frameDecompose.Visible = False
        frameShades.Visible = False
        
    End If
    
End Sub

'This function ensures that a long-type variable falls into the range of 0-255
Public Function ByteMeL(ByRef TempVar As Long) As Byte
    If TempVar > 255 Then
        ByteMeL = 255
    ElseIf TempVar < 0 Then
        ByteMeL = 0
    Else
        ByteMeL = CByte(TempVar)
    End If
End Function

'Return the maximum of three Long-type variables
Private Function Maximum(rR As Long, rG As Long, rB As Long) As Long
   If (rR > rG) Then
      If (rR > rB) Then
         Maximum = rR
      Else
         Maximum = rB
      End If
   Else
      If (rB > rG) Then
         Maximum = rB
      Else
         Maximum = rG
      End If
   End If
End Function

'Return the minimum of three Long-type variables
Private Function Minimum(rR As Long, rG As Long, rB As Long) As Long
   If (rR < rG) Then
      If (rR < rB) Then
         Minimum = rR
      Else
         Minimum = rB
      End If
   Else
      If (rB < rG) Then
         Minimum = rB
      Else
         Minimum = rG
      End If
   End If
End Function

'If one of the Color Channel option buttons are clicked, redraw the image to match
Private Sub optChannel_Click(Index As Integer)
    drawGrayscaleSingleChannel picBack, picMain, Index
End Sub

'If one of the Decompose option buttons are clicked, redraw the image to match
Private Sub optDecompose_Click(Index As Integer)
    drawGrayscaleDecompose picBack, picMain, optDecompose(0).Value
End Sub


'Convert an image to grayscale using the (R+G+B)/3 formula
Public Sub drawGrayscaleAverageMethod(srcPic As PictureBox, dstPic As PictureBox)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Byte, G As Byte, B As Byte
    
    'This look-up table holds all possible totals of adding together the R, G, and B values of an image (0 to 255*3 - for pure white)
    Dim grayLookup(0 To 765) As Byte
    
    'Populate the look-up table
    For x = 0 To 765
        grayLookup(x) = x \ 3
    Next x
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Look up this pixel's value in the lookup table
        Gray = grayLookup(CLng(R) + CLng(G) + CLng(B))
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to grayscale using a formula based on cone density of the human eye [ (222 * R + 707 * G + 71 * B) \ 1000 ]
Public Sub drawGrayscaleHumanMethod(srcPic As PictureBox, dstPic As PictureBox)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Long, G As Long, B As Long
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Look up this pixel's value in the lookup table
        Gray = ByteMeL((222 * R + 707 * G + 71 * B) \ 1000)
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to grayscale using the standard luminance formula [ (Max(R,G,B) + Min(R,G,B)) \ 2 ]
Public Sub drawDesaturate(srcPic As PictureBox, dstPic As PictureBox)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Long, G As Long, B As Long
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'These variables will hold the maximum and minimum channel values for each pixel
    Dim cMax As Long, cMin As Long
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Look up this pixel's value in the lookup table
        cMax = Maximum(R, G, B)
        cMin = Minimum(R, G, B)
        
        Gray = ByteMeL((cMax + cMin) \ 2)
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to grayscale using a channel decompose function (which uses either the minimum [true] or maximum [false] color channel as the gray value)
Public Sub drawGrayscaleDecompose(srcPic As PictureBox, dstPic As PictureBox, Optional ByVal minValue As Boolean = True)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Long, G As Long, B As Long
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Assign a gray value based on the low or high value, as determined by the minValue parameter
        If minValue = True Then
            Gray = ByteMeL(Minimum(R, G, B))
        Else
            Gray = ByteMeL(Maximum(R, G, B))
        End If
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to grayscale using a channel decompose function (where red = 0, green = 1, blue = 2)
Public Sub drawGrayscaleSingleChannel(srcPic As PictureBox, dstPic As PictureBox, Optional ByVal cChannel As Long = 0)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Long, G As Long, B As Long
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Assign a gray value based on the red, green, or blue channel, as determined by the cChannel parameter
        If cChannel = 0 Then
            Gray = R
        ElseIf cChannel = 1 Then
            Gray = G
        Else
            Gray = B
        End If
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to a specific number of shades of gray; any value in the range [2,256] is acceptable
Public Sub drawGrayscaleCustomShades(srcPic As PictureBox, dstPic As PictureBox, Optional ByVal numOfShades As Long = 256)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Byte, G As Byte, B As Byte
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'This conversionFactor is the value we need to turn grayscale values in the [0,255] range into a specific subset of values
    Dim conversionFactor As Single
    conversionFactor = (255 / (numOfShades - 1))
    
    'This algorithm is well-suited to using a look-up table, so let's build one and (obviously!) prepopulate it
    Dim grayLookup(0 To 255) As Byte
    Dim grayTempCalc As Long
    
    For x = 0 To 255
        grayTempCalc = Int((CDbl(x) / conversionFactor) + 0.5) * conversionFactor
        grayLookup(x) = ByteMeL(grayTempCalc)
    Next x
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    For x = 0 To iWidth - 1
        QuickX = x * 3
    For y = 0 To iHeight - 1
        
        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'Look up this pixel's value in the lookup table
        Gray = grayLookup((CLng(R) + CLng(G) + CLng(B)) \ 3)
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next y
    Next x
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub


'Convert an image to a specific number of shades of gray (WITH error-diffusion dithering support!)
Public Sub drawGrayscaleCustomShadesDithered(srcPic As PictureBox, dstPic As PictureBox, Optional ByVal numOfShades As Long = 256)

    'These arrays will hold the source and destination image's pixel data, respectively
    Dim ImageData() As Byte
    
    'Coordinate variables
    Dim x As Long, y As Long
    
    'Image dimensions
    Dim iWidth As Long, iHeight As Long
    
    'Instantiate a FastDrawing class and gather the image's data (into ImageData())
    Dim fDraw As New FastDrawing
    iWidth = fDraw.GetImageWidth(srcPic)
    iHeight = fDraw.GetImageHeight(srcPic)
    fDraw.GetImageData2D srcPic, ImageData()
    
    'These variables will hold temporary pixel color values (red, green, blue)
    Dim R As Byte, G As Byte, B As Byte
    
    'This value will hold the grayscale value of each pixel
    Dim Gray As Byte
    
    'This look-up table holds all possible totals of adding together the R, G, and B values of an image (0 to 255*3 - for pure white)
    Dim grayLookup(0 To 765) As Byte
    
    'Populate the look-up table
    For x = 0 To 765
        grayLookup(x) = x \ 3
    Next x
    
    'This conversionFactor is the value we need to turn grayscale values in the [0,255] range into a specific subset of values
    Dim conversionFactor As Single
    conversionFactor = (255 / (numOfShades - 1))
    
    'Unfortunately, this algorithm (unlike its non-dithering counterpart) is not well-suited to using a look-up table, so all calculations have been moved into the loop
    Dim grayTempCalc As Long
    
    'This value tracks the drifting error of our conversions, which allows us to dither
    Dim errorValue As Long
    errorValue = 0
    
    'Loop through the image, adjusting pixel values as we go
    Dim QuickX As Long
    
    'Note that I have reversed the loop order (now we go horizontally instead of vertically).
    ' This is because I want my dithering algorithm to work from left-to-right instead of top-to-bottom.
    For y = 0 To iHeight - 1
    For x = 0 To iWidth - 1
        QuickX = x * 3

        'Get the source image pixels
        R = ImageData(QuickX + 2, y)
        G = ImageData(QuickX + 1, y)
        B = ImageData(QuickX, y)
        
        'First, generate a raw grayscale value
        Gray = grayLookup(CLng(R) + CLng(G) + CLng(B))
        grayTempCalc = Gray
        
        'Add the error value (a cumulative value of the difference between actual gray values and gray values we've selected) to the current gray value
        grayTempCalc = grayTempCalc + errorValue
        
        'Rebuild our temporary calculation variable using the shade reduction formula
        grayTempCalc = Int((CDbl(grayTempCalc) / conversionFactor) + 0.5) * conversionFactor
        
        'Adjust our error value to include this latest calculation
        errorValue = CLng(Gray) + errorValue - grayTempCalc
        
        Gray = ByteMeL(grayTempCalc)
        
        'Assign all color channels to the new gray value
        ImageData(QuickX + 2, y) = Gray
        ImageData(QuickX + 1, y) = Gray
        ImageData(QuickX, y) = Gray
        
    Next x
        'Reset our error value after each row
        errorValue = 0
    Next y
    
    'Draw the new image data to the screen
    fDraw.SetImageData2D dstPic, iWidth, iHeight, ImageData()

End Sub

