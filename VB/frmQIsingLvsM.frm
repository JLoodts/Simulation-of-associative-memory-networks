VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmQIsingLvsM 
   Caption         =   "     QIsing: l vs m"
   ClientHeight    =   4935
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13500
   Icon            =   "frmQIsingLvsM.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4935
   ScaleWidth      =   13500
   Begin VB.Frame frmHopfieldMvsTemp 
      Caption         =   "Plot"
      Height          =   4875
      Left            =   6570
      TabIndex        =   36
      Top             =   0
      Width           =   6855
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4560
         Left            =   90
         OleObjectBlob   =   "frmQIsingLvsM.frx":014A
         TabIndex        =   37
         Top             =   180
         Width           =   6675
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Overlap l"
      Height          =   1725
      Left            =   4680
      TabIndex        =   26
      Top             =   1920
      Width           =   1545
      Begin VB.TextBox txtYMin 
         Height          =   285
         Left            =   765
         TabIndex        =   29
         Text            =   "0"
         Top             =   315
         Width           =   555
      End
      Begin VB.TextBox txtYMax 
         Height          =   285
         Left            =   765
         TabIndex        =   28
         Text            =   "1"
         Top             =   675
         Width           =   555
      End
      Begin VB.TextBox txtDimY 
         Height          =   285
         Left            =   450
         TabIndex        =   27
         Text            =   "5"
         Top             =   1305
         Width           =   915
      End
      Begin VB.Label Label4 
         Caption         =   "Min :"
         Height          =   195
         Index           =   1
         Left            =   180
         TabIndex        =   32
         Top             =   315
         Width           =   420
      End
      Begin VB.Label Label11 
         Caption         =   "Max :"
         Height          =   195
         Left            =   180
         TabIndex        =   31
         Top             =   675
         Width           =   465
      End
      Begin VB.Label Label9 
         Caption         =   "# Samples :"
         Height          =   240
         Left            =   180
         TabIndex        =   30
         Top             =   1035
         Width           =   1050
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Parameters"
      Height          =   4920
      Left            =   75
      TabIndex        =   0
      Top             =   0
      Width           =   6360
      Begin VB.Frame Frame9 
         Caption         =   "Transferfunction"
         Height          =   615
         Left            =   195
         TabIndex        =   33
         Top             =   3135
         Width           =   2055
         Begin VB.TextBox txtB 
            Height          =   285
            Left            =   840
            TabIndex        =   34
            Text            =   "0.5"
            Top             =   240
            Width           =   495
         End
         Begin VB.Label Label10 
            Caption         =   "b :"
            Height          =   255
            Left            =   240
            TabIndex        =   35
            Top             =   240
            Width           =   255
         End
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         Height          =   330
         Left            =   4815
         TabIndex        =   25
         Top             =   4110
         Width           =   1140
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Load"
         Height          =   330
         Left            =   4815
         TabIndex        =   24
         Top             =   3735
         Width           =   1140
      End
      Begin VB.CommandButton cmdPlot 
         Caption         =   "Plot"
         Height          =   330
         Left            =   4815
         TabIndex        =   23
         Top             =   4500
         Width           =   1140
      End
      Begin VB.Frame Frame3 
         Caption         =   "Iterations"
         Height          =   1365
         Left            =   2880
         TabIndex        =   18
         Top             =   3120
         Width           =   1545
         Begin VB.TextBox txtMaxNrIterations 
            Height          =   285
            Left            =   585
            TabIndex        =   20
            Text            =   "10000"
            Top             =   315
            Width           =   735
         End
         Begin VB.TextBox txtNrData 
            Height          =   285
            Left            =   450
            TabIndex        =   19
            Text            =   "100"
            Top             =   945
            Width           =   915
         End
         Begin VB.Label Label5 
            Caption         =   "Max :"
            Height          =   195
            Left            =   180
            TabIndex        =   22
            Top             =   315
            Width           =   465
         End
         Begin VB.Label Label2 
            Caption         =   "# Samples :"
            Height          =   240
            Left            =   180
            TabIndex        =   21
            Top             =   675
            Width           =   1050
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "Overlap m"
         Height          =   1680
         Left            =   4590
         TabIndex        =   11
         Top             =   180
         Width           =   1545
         Begin VB.TextBox txtDimX 
            Height          =   285
            Left            =   450
            TabIndex        =   14
            Text            =   "5"
            Top             =   1305
            Width           =   915
         End
         Begin VB.TextBox txtXMax 
            Height          =   285
            Left            =   765
            TabIndex        =   13
            Text            =   "1"
            Top             =   675
            Width           =   555
         End
         Begin VB.TextBox txtXMin 
            Height          =   285
            Left            =   765
            TabIndex        =   12
            Text            =   "0"
            Top             =   315
            Width           =   555
         End
         Begin VB.Label Label8 
            Caption         =   "# Samples :"
            Height          =   240
            Left            =   180
            TabIndex        =   17
            Top             =   1035
            Width           =   1050
         End
         Begin VB.Label Label7 
            Caption         =   "Max :"
            Height          =   195
            Left            =   180
            TabIndex        =   16
            Top             =   675
            Width           =   465
         End
         Begin VB.Label Label4 
            Caption         =   "Min :"
            Height          =   195
            Index           =   0
            Left            =   180
            TabIndex        =   15
            Top             =   315
            Width           =   420
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Update"
         Height          =   915
         Left            =   180
         TabIndex        =   8
         Top             =   990
         Width           =   4245
         Begin VB.OptionButton optUpdateAsynch 
            Caption         =   "Asynchronously"
            Height          =   285
            Left            =   900
            TabIndex        =   10
            Top             =   225
            Value           =   -1  'True
            Width           =   1545
         End
         Begin VB.OptionButton optUpdateSynch 
            Caption         =   "Synchronously"
            Height          =   240
            Left            =   900
            TabIndex        =   9
            Top             =   540
            Width           =   1590
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Size"
         Height          =   735
         Left            =   180
         TabIndex        =   5
         Top             =   225
         Width           =   4245
         Begin VB.TextBox txtN 
            Height          =   285
            Left            =   900
            TabIndex        =   6
            Text            =   "1000"
            Top             =   270
            Width           =   960
         End
         Begin VB.Label Label6 
            Caption         =   "neurons"
            Height          =   240
            Left            =   1935
            TabIndex        =   7
            Top             =   315
            Width           =   1005
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Load parameter"
         Height          =   1140
         Left            =   180
         TabIndex        =   1
         Top             =   1935
         Width           =   4245
         Begin VB.HScrollBar sclAlfa 
            Height          =   240
            Left            =   1665
            Max             =   20
            TabIndex        =   3
            Top             =   480
            Value           =   10
            Width           =   2310
         End
         Begin VB.TextBox txtAlfa 
            Height          =   285
            Left            =   900
            TabIndex        =   2
            Text            =   "0.1"
            Top             =   435
            Width           =   465
         End
         Begin VB.Label Label3 
            Caption         =   "Alfa :"
            Height          =   240
            Left            =   135
            TabIndex        =   4
            Top             =   465
            Width           =   420
         End
      End
      Begin MSComDlg.CommonDialog cmnPath 
         Left            =   5130
         Top             =   2655
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         CancelError     =   -1  'True
      End
   End
End
Attribute VB_Name = "frmQIsingLvsM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function l_m_QIsing _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer

Private Declare Function test _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal name As String, ByRef alfa As Long, ByRef N As Integer) _
                     As Integer
                     
Private Const c_strDefaultOut As String = "D:\ANN_VB\defaultData\l_m_QIsing_out.txt"
Private Const c_strFileNameIn As String = "D:\ANN_VB\data\l_m_QIsing_in.txt"
Private Const c_strFileNameOut As String = "D:\ANN_VB\data\l_m_QIsing_out.txt"
                     
Private Sub cmdLoad_Click()
    Dim strPath As String
    On Error GoTo ErrHandler
    cmnPath.ShowOpen
    strPath = cmnPath.FileName
    pvtLoadParam (strPath)
ErrHandler:
End Sub

Private Sub pvtLoadParam(strPath As String)

    Dim intFileNr As Integer
    Dim strLine As String
    intFileNr = FreeFile

    Open strPath For Input As intFileNr
    
    Line Input #intFileNr, strLine
    txtAlfa.Text = Right(strLine, Len(strLine) - Len(c_strAlfa) - 1)
    sclAlfa.Value = Val(txtAlfa.Text) * 100
    Line Input #intFileNr, strLine
    txtB.Text = Right(strLine, Len(strLine) - Len(c_strB) - 1)
    Line Input #intFileNr, strLine
    txtN.Text = Right(strLine, Len(strLine) - Len(c_strN) - 1)
    Line Input #intFileNr, strLine
    txtMaxNrIterations.Text = Right(strLine, Len(strLine) - Len(c_strMaxNrIterations) - 1)
    Line Input #intFileNr, strLine
    txtNrData.Text = Right(strLine, Len(strLine) - Len(c_strNrData) - 1)
    Line Input #intFileNr, strLine
    optUpdateAsynch.Value = IIf(Right(strLine, Len(strLine) - Len(c_strUpdateAsynch) - 1) = "1", True, False)
    optUpdateSynch.Value = Not (optUpdateAsynch.Value)
    Line Input #intFileNr, strLine
    txtXMin.Text = Right(strLine, Len(strLine) - Len(c_strXMin) - 1)
    Line Input #intFileNr, strLine
    txtXMax.Text = Right(strLine, Len(strLine) - Len(c_strXMax) - 1)
    Line Input #intFileNr, strLine
    txtDimX.Text = Right(strLine, Len(strLine) - Len(c_strDimX) - 1)
    Line Input #intFileNr, strLine
    txtYMin.Text = Right(strLine, Len(strLine) - Len(c_strYMin) - 1)
    Line Input #intFileNr, strLine
    txtYMax.Text = Right(strLine, Len(strLine) - Len(c_strYMax) - 1)
    Line Input #intFileNr, strLine
    txtDimY.Text = Right(strLine, Len(strLine) - Len(c_strDimY) - 1)
  
    Close intFileNr
    
End Sub

Private Sub cmdPlot_Click()
    Dim returnValue As Integer
    pvtSave (False)
    returnValue = l_m_QIsing(c_strFileNameIn, c_strFileNameOut)
    If (returnValue > 0) Then
        ChartIt (c_strFileNameOut)
    Else
        MsgBox "Unexpected result during calculations"
    End If
End Sub

Private Sub ChartIt(strFileName As String)

    Dim intNrData As Integer
    Dim intNrSeries As Integer
    Dim arrChartPoints() As Double
    Dim intSeries As Integer
    Dim intTeller As Integer
    
    arrChartPoints = GetArrayLvsM(strFileName, intNrSeries, intNrData)
    MSChart1.RowCount = intNrData
    MSChart1.ColumnCount = intNrSeries * 2
    MSChart1.ColumnLabelCount = intNrSeries * 2
    
    MSChart1.Plot.UniformAxis = False
    
    'Set white as the backgroundcolour of the chart
    MSChart1.Plot.Wall.Brush.Style = VtBrushStyleSolid
    
    'Create the plot points for this series from the arrChartPoints array:
    For intSeries = 1 To intNrSeries
        'Select wether you want markers and or a line connecting the data points
        'MSChart1.Plot.SeriesCollection.Item(intSeries * 2 - 1).SeriesMarker.Show = True
        MSChart1.Plot.SeriesCollection.Item(intSeries * 2 - 1).ShowLine = True
        For intTeller = 1 To intNrData
            MSChart1.DataGrid.SetData intTeller, intSeries * 2 - 1, arrChartPoints(intSeries * 2 - 1, intTeller), False
            MSChart1.DataGrid.SetData intTeller, intSeries * 2, arrChartPoints(intSeries * 2, intTeller), False
        Next
    Next
    MSChart1.Refresh
SubExit:
    MousePointer = 0
End Sub


Private Sub pvtSave(blnWithDialogue As Boolean)

    Dim strPath As String
    Dim intFileNr As Integer
    Dim strLine As String
    
    intFileNr = FreeFile
    On Error GoTo ErrHandler
    If (blnWithDialogue) Then
        cmnPath.ShowSave
        strPath = cmnPath.FileName
    Else
        strPath = c_strFileNameIn
    End If
    
    Open strPath For Output As intFileNr
    
    Print #intFileNr, "alfa "; txtAlfa.Text
    Print #intFileNr, "b "; txtB.Text
    Print #intFileNr, "N "; txtN.Text
    Print #intFileNr, "maxNrIterations "; txtMaxNrIterations.Text
    Print #intFileNr, "nrData "; txtNrData.Text
    Print #intFileNr, "updateAsynch "; IIf(optUpdateAsynch.Value, "1", "0")
    Print #intFileNr, "xMin "; txtXMin.Text
    Print #intFileNr, "xMax "; txtXMax.Text
    Print #intFileNr, "dimX "; txtDimX.Text
    Print #intFileNr, "yMin "; txtYMin.Text
    Print #intFileNr, "yMax "; txtYMax.Text
    Print #intFileNr, "dimY "; txtDimY.Text
    
    Close intFileNr

ErrHandler:
    
End Sub

Private Sub cmdSave_Click()
    pvtSave (True)
End Sub


Private Sub Form_Load()
    If Dir$("D:\ANN_VB\ann.dll") = "" Then
        MsgBox "The DLL could not be loaded!"
    End If

    If Dir$(c_strFileNameIn) = "" Then
        MsgBox "The InputFile could not be loaded!"
    End If

    If Dir$(c_strFileNameOut) = "" Then
        MsgBox "The InputFile could not be loaded!"
    End If

    pvtLoadParam (c_strDefaultOut)
    ChartIt (c_strDefaultOut)
    'Give the frame the right dimensions and position
    Me.Move 0, 0, c_intFrameWidth, c_intFrameHeight
End Sub

Private Sub sclAlfa_Change()
    txtAlfa.Text = sclAlfa.Value / 100
End Sub

Private Sub txtAlfa_GotFocus()
    txtAlfa.SelStart = 0
    txtAlfa.SelLength = Len(txtAlfa.Text)
End Sub

Private Sub txtAlfa_LostFocus()
    sclAlfa.Value = Val(txtAlfa.Text) * 100
End Sub

Private Sub txtN_GotFocus()
    txtN.SelStart = 0
    txtN.SelLength = Len(txtN.Text)
End Sub
Private Sub txtMaxNrIterations_GotFocus()
    txtMaxNrIterations.SelStart = 0
    txtMaxNrIterations.SelLength = Len(txtMaxNrIterations.Text)
End Sub

Private Sub txtDimX_GotFocus()
    txtDimX.SelStart = 0
    txtDimX.SelLength = Len(txtDimX.Text)
End Sub

Private Sub txtYMax_GotFocus()
    txtYMax.SelStart = 0
    txtYMax.SelLength = Len(txtYMax.Text)
End Sub

Private Sub txtYMin_GotFocus()
    txtYMin.SelStart = 0
    txtYMin.SelLength = Len(txtYMin.Text)
End Sub

Private Sub txtB_GotFocus()
    txtB.SelStart = 0
    txtB.SelLength = Len(txtB.Text)
End Sub

Private Sub txtXMax_GotFocus()
    txtXMax.SelStart = 0
    txtXMax.SelLength = Len(txtXMax.Text)
End Sub

Private Sub txtXMin_GotFocus()
    txtXMin.SelStart = 0
    txtXMin.SelLength = Len(txtXMin.Text)
End Sub

Private Sub txtDimY_GotFocus()
    txtDimY.SelStart = 0
    txtDimY.SelLength = Len(txtDimY.Text)
End Sub
