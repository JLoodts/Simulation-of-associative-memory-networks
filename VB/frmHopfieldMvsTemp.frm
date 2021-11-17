VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmHopfieldMvsTemp 
   Caption         =   "     Hopfield: m vs temperature"
   ClientHeight    =   4935
   ClientLeft      =   1560
   ClientTop       =   345
   ClientWidth     =   13500
   Icon            =   "frmHopfieldMvsTemp.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4935
   ScaleWidth      =   13500
   Begin VB.Frame Frame1 
      Caption         =   "Parameters"
      Height          =   4920
      Left            =   45
      TabIndex        =   1
      Top             =   0
      Width           =   6360
      Begin VB.Frame Frame5 
         Caption         =   "Deviation of the beginstate from the target"
         Height          =   780
         Left            =   180
         TabIndex        =   27
         Top             =   4005
         Width           =   4245
         Begin VB.TextBox txtDeviation 
            Height          =   285
            Left            =   900
            TabIndex        =   29
            Text            =   "0.1"
            Top             =   300
            Width           =   465
         End
         Begin VB.HScrollBar sclDeviation 
            Height          =   240
            Left            =   1665
            Max             =   20
            TabIndex        =   28
            Top             =   360
            Value           =   10
            Width           =   2310
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Load parameter"
         Height          =   1140
         Left            =   180
         TabIndex        =   21
         Top             =   2760
         Width           =   4245
         Begin VB.TextBox txtAlfaCritPct 
            BackColor       =   &H80000004&
            Enabled         =   0   'False
            Height          =   285
            Left            =   900
            TabIndex        =   24
            Text            =   "72"
            Top             =   675
            Width           =   465
         End
         Begin VB.TextBox txtAlfa 
            Height          =   285
            Left            =   900
            TabIndex        =   23
            Text            =   "0.1"
            Top             =   315
            Width           =   465
         End
         Begin VB.HScrollBar sclAlfa 
            Height          =   240
            Left            =   1665
            Max             =   20
            TabIndex        =   22
            Top             =   360
            Value           =   10
            Width           =   2310
         End
         Begin VB.Label Label1 
            Caption         =   "% of critical load"
            Height          =   240
            Left            =   1440
            TabIndex        =   26
            Top             =   720
            Width           =   1410
         End
         Begin VB.Label Label3 
            Caption         =   "Alfa :"
            Height          =   240
            Left            =   135
            TabIndex        =   25
            Top             =   345
            Width           =   420
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Maximum"
         Height          =   735
         Left            =   180
         TabIndex        =   18
         Top             =   1950
         Width           =   4245
         Begin VB.TextBox txtMaxNrIterations 
            Height          =   285
            Left            =   900
            TabIndex        =   19
            Text            =   "10000"
            Top             =   270
            Width           =   780
         End
         Begin VB.Label Label5 
            Caption         =   "iterations"
            Height          =   240
            Left            =   1755
            TabIndex        =   20
            Top             =   315
            Width           =   960
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Size"
         Height          =   735
         Left            =   180
         TabIndex        =   15
         Top             =   180
         Width           =   4245
         Begin VB.TextBox txtN 
            Height          =   285
            Left            =   900
            TabIndex        =   16
            Text            =   "1000"
            Top             =   270
            Width           =   960
         End
         Begin VB.Label Label6 
            Caption         =   "neurons"
            Height          =   240
            Left            =   1935
            TabIndex        =   17
            Top             =   315
            Width           =   1005
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Update"
         Height          =   915
         Left            =   180
         TabIndex        =   12
         Top             =   975
         Width           =   4245
         Begin VB.OptionButton optUpdateSynch 
            Caption         =   "Synchronously"
            Height          =   240
            Left            =   900
            TabIndex        =   14
            Top             =   540
            Width           =   1590
         End
         Begin VB.OptionButton optUpdateAsynch 
            Caption         =   "Asynchronously"
            Height          =   285
            Left            =   900
            TabIndex        =   13
            Top             =   225
            Value           =   -1  'True
            Width           =   1545
         End
      End
      Begin VB.CommandButton cmdPlot 
         Caption         =   "Plot"
         Height          =   330
         Left            =   4815
         TabIndex        =   11
         Top             =   4320
         Width           =   1140
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Load"
         Height          =   330
         Left            =   4815
         TabIndex        =   10
         Top             =   3465
         Width           =   1140
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         Height          =   330
         Left            =   4815
         TabIndex        =   9
         Top             =   3885
         Width           =   1140
      End
      Begin VB.Frame Frame8 
         Caption         =   "Temperature"
         Height          =   1725
         Left            =   4590
         TabIndex        =   2
         Top             =   180
         Width           =   1545
         Begin VB.TextBox txtXMin 
            Height          =   285
            Left            =   765
            TabIndex        =   5
            Text            =   "0"
            Top             =   315
            Width           =   555
         End
         Begin VB.TextBox txtXMax 
            Height          =   285
            Left            =   765
            TabIndex        =   4
            Text            =   "1"
            Top             =   675
            Width           =   555
         End
         Begin VB.TextBox txtDimX 
            Height          =   285
            Left            =   450
            TabIndex        =   3
            Text            =   "100"
            Top             =   1305
            Width           =   915
         End
         Begin VB.Label Label4 
            Caption         =   "Min :"
            Height          =   195
            Index           =   0
            Left            =   180
            TabIndex        =   8
            Top             =   315
            Width           =   420
         End
         Begin VB.Label Label7 
            Caption         =   "Max :"
            Height          =   195
            Left            =   180
            TabIndex        =   7
            Top             =   675
            Width           =   465
         End
         Begin VB.Label Label8 
            Caption         =   "# Samples :"
            Height          =   240
            Left            =   180
            TabIndex        =   6
            Top             =   1035
            Width           =   1050
         End
      End
      Begin MSComDlg.CommonDialog cmnPath 
         Left            =   5130
         Top             =   2640
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         CancelError     =   -1  'True
      End
   End
   Begin VB.Frame frmHopfieldMvsTemp 
      Caption         =   "Plot"
      Height          =   4920
      Left            =   6525
      TabIndex        =   0
      Top             =   0
      Width           =   6945
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4650
         Left            =   45
         OleObjectBlob   =   "frmHopfieldMvsTemp.frx":014A
         TabIndex        =   30
         Top             =   180
         Width           =   6720
      End
   End
End
Attribute VB_Name = "frmHopfieldMvsTemp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function m_temp_Hopfield _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal strFileNameIn As String, ByVal strFileNameOut As String) _
                     As Integer

Private Declare Function test _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal name As String, ByRef alfa As Long, ByRef N As Integer) _
                     As Integer
                     
Private Const c_strDefaultOut As String = "D:\ANN_VB\defaultData\m_temp_Hopfield_out.txt"
Private Const c_strFileNameIn As String = "D:\ANN_VB\data\m_temp_Hopfield_in.txt"
Private Const c_strFileNameOut As String = "D:\ANN_VB\data\m_temp_Hopfield_out.txt"




Private Sub pvtLoadParam(strPath As String)

    Dim intFileNr As Integer
    Dim strLine As String
    intFileNr = FreeFile

    Open strPath For Input As intFileNr
    
    Line Input #intFileNr, strLine
    txtAlfa.Text = Right(strLine, Len(strLine) - Len(c_strAlfa) - 1)
    sclAlfa.Value = Val(txtAlfa.Text) * 100
    txtAlfaCritPct = Format(sclAlfa.Value / c_dblAlfaCritical, "0")
    Line Input #intFileNr, strLine
    txtDeviation.Text = Val(Right(strLine, Len(strLine) - Len(c_strDeviation) - 1))
    sclDeviation.Value = Val(txtDeviation.Text) * 100
    Line Input #intFileNr, strLine
    txtN.Text = Right(strLine, Len(strLine) - Len(c_strN) - 1)
    Line Input #intFileNr, strLine
    txtMaxNrIterations.Text = Right(strLine, Len(strLine) - Len(c_strMaxNrIterations) - 1)
    Line Input #intFileNr, strLine
    optUpdateAsynch.Value = IIf(Right(strLine, Len(strLine) - Len(c_strUpdateAsynch) - 1) = "1", True, False)
    optUpdateSynch.Value = Not (optUpdateAsynch.Value)
    Line Input #intFileNr, strLine
    txtXMin.Text = Right(strLine, Len(strLine) - Len(c_strXMin) - 1)
    Line Input #intFileNr, strLine
    txtXMax.Text = Right(strLine, Len(strLine) - Len(c_strXMax) - 1)
    Line Input #intFileNr, strLine
    txtDimX.Text = Right(strLine, Len(strLine) - Len(c_strDimX) - 1)
  
    Close intFileNr
End Sub

Private Sub cmdLoad_Click()
    Dim strPath As String
    On Error GoTo ErrHandler
        cmnPath.ShowOpen
        strPath = cmnPath.FileName
        pvtLoadParam (strPath)
ErrHandler:
    
End Sub


Private Sub cmdPlot_Click()
    Dim returnValue As Integer
    pvtSave (False)
    returnValue = m_temp_Hopfield(c_strFileNameIn, c_strFileNameOut)
    If (returnValue > 0) Then
        ChartIt (c_strFileNameOut)
    Else
        MsgBox "Unexpected result during calculations"
    End If
End Sub


Private Sub ChartIt(strFileName As String)

    Dim intNrData As Integer
    Dim intNrSeries As Integer
    Dim intCurSeries As Integer
        
    intNrSeries = 1
    intCurSeries = 1
    
    Dim arrChartPoints() As Double
    arrChartPoints = Get2DArray(strFileName)
    'see what the number of data is for the first series
    intNrData = 100
    MSChart1.RowCount = intNrData
    'We need to increase the ColumnCount. For X-Y Scatter graphs, we
    'need 2 columns for each series.
    MSChart1.ColumnCount = intCurSeries * 2
    MSChart1.ColumnLabelCount = intCurSeries * 2
    
    MSChart1.chartType = VtChChartType2dXY
 '   MSChart1.ShowLegend = True
        
'    MSChart1.Plot.Axis(VtChAxisIdY).AxisTitle.Visible = True
'    MSChart1.Plot.Axis(VtChAxisIdY).AxisTitle.Text = "Energy"
'
'    MSChart1.Plot.Axis(VtChAxisIdX).AxisTitle.Visible = True
'    MSChart1.Plot.Axis(VtChAxisIdX).AxisTitle.Text = "# updates"
    
    MSChart1.Plot.UniformAxis = False
    
    'Set white as the backgroundcolour of the chart
    MSChart1.Plot.Wall.Brush.Style = VtBrushStyleSolid
'   Color is already white by default
'   MSChart1.Plot.Wall.Brush.FillColor.Set 255, 255, 255
                  
    'Select wether you want markers and or a line connecting the data points
    'MSChart1.Plot.SeriesCollection.Item(intCurSeries * 2 - 1).SeriesMarker.Show = True
    MSChart1.Plot.SeriesCollection.Item(intCurSeries * 2 - 1).ShowLine = True
    
    'Create the plot points for this series from the arrChartPoints array:
    Dim intRow As Integer
    For intRow = 1 To intNrData
        MSChart1.DataGrid.SetData intRow, intCurSeries * 2 - 1, arrChartPoints(1, intRow), False
        MSChart1.DataGrid.SetData intRow, intCurSeries * 2, arrChartPoints(2, intRow), False
    Next
    
    'Remove null points from *this* series, if it has *fewer*
    MSChart1.Refresh
SubExit:
    MousePointer = 0
End Sub



'Private Sub pvtValidateInt(strValue As String, intMin As Integer, intMax As Integer)
'    If ((Val(strValue) < intMin) Or (Val(strValue) > intMax)) Then
'        Dim strValueNew As String
'        strValueNew = InputBox("Please enter a valid value", "Error in input")
'        strValue = strValueNew
'    End If
'End Sub

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
    Print #intFileNr, "deviation "; txtDeviation.Text
    Print #intFileNr, "N "; txtN.Text
    Print #intFileNr, "maxNrIterations "; txtMaxNrIterations.Text
    Print #intFileNr, "updateAsynch "; IIf(optUpdateAsynch.Value, "1", "0")
    Print #intFileNr, "xMin "; txtXMin.Text
    Print #intFileNr, "xMax "; txtXMax.Text
    Print #intFileNr, "dimX "; txtDimX.Text
    
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
    Me.Move 0, 0, 13620, 6045
End Sub

Private Sub sclDeviation_Change()
    txtDeviation.Text = sclDeviation.Value / 100
End Sub

Private Sub sclAlfa_Change()
    txtAlfa.Text = sclAlfa.Value / 100
    txtAlfaCritPct = Format(sclAlfa.Value / c_dblAlfaCritical, "0")
End Sub

Private Sub txtAlfa_GotFocus()
    txtAlfa.SelStart = 0
    txtAlfa.SelLength = Len(txtAlfa.Text)
End Sub

Private Sub txtAlfa_LostFocus()
    'pvtValidateInt txtAlfa.Text, 0, 1
    sclAlfa.Value = Val(txtAlfa.Text) * 100
    txtAlfaCritPct = Format(sclAlfa.Value / c_dblAlfaCritical, "0")
End Sub

Private Sub txtDeviation_GotFocus()
    txtDeviation.SelStart = 0
    txtDeviation.SelLength = Len(txtDeviation.Text)
End Sub

Private Sub txtDeviation_LostFocus()
    If Val(txtDeviation.Text) < 0 Then txtDeviation.Text = 0
    If Val(txtDeviation.Text) > 1 Then txtDeviation.Text = 1
    sclDeviation.Value = Val(txtDeviation.Text) * 100
End Sub

Private Sub txtN_GotFocus()
    txtN.SelStart = 0
    txtN.SelLength = Len(txtN.Text)
End Sub

Private Sub txtMaxNrIterations_GotFocus()
    txtMaxNrIterations.SelStart = 0
    txtMaxNrIterations.SelLength = Len(txtMaxNrIterations.Text)
End Sub

Private Sub txtXMax_GotFocus()
    txtXMax.SelStart = 0
    txtXMax.SelLength = Len(txtXMax.Text)
End Sub

Private Sub txtXMin_GotFocus()
    txtXMin.SelStart = 0
    txtXMin.SelLength = Len(txtXMin.Text)
End Sub

Private Sub txtDimX_GotFocus()
    txtDimX.SelStart = 0
    txtDimX.SelLength = Len(txtDimX.Text)
End Sub

