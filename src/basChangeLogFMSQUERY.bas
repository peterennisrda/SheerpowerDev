Option Compare Database
Option Explicit

Public Const gstrDATE_FMSQUERY As String = "February 5, 2019"
Public Const gstrVERSION_FMSQUERY As String = "0.0.1"
Public Const gstrPROJECT_FMSQUERY As String = "FMSQUERY"
Public Const gblnTEST_FMSQUERY As Boolean = False
'

' Public Const FMSQUERY_SQL_FRONT_END = False

Public Function EXPORT_FMSQUERY(Optional ByVal varDebug As Variant)

    Const THE_FRONT_END_APP = True
    Const THE_SOURCE_FOLDER = ".\src\"
    Const THE_XML_FOLDER = ".\src\xml\"
    Const THE_XML_DATA_FOLDER = ".\srcl\xmldata\"
    Const THE_BACK_END_SOURCE_FOLDER = "NONE"
    Const THE_BACK_END_XML_FOLDER = "NONE"
    Const THE_BACK_END_DB1 = "NONE"

    On Error GoTo 0

    If Not IsMissing(varDebug) Then
        aegitClassTest varDebug:="varDebug", varSrcFldr:=THE_SOURCE_FOLDER, varSrcFldrBe:=THE_BACK_END_SOURCE_FOLDER, _
                        varXmlFldr:=THE_XML_FOLDER, varXmlDataFldr:=THE_XML_DATA_FOLDER, _
                        varFrontEndApp:=THE_FRONT_END_APP, _
                        varBackEndDbOne:=THE_BACK_END_DB1
    Else
        aegitClassTest varSrcFldr:=THE_SOURCE_FOLDER, varSrcFldrBe:=THE_BACK_END_SOURCE_FOLDER, _
                        varXmlFldr:=THE_XML_FOLDER, varXmlDataFldr:=THE_XML_DATA_FOLDER, _
                        varFrontEndApp:=THE_FRONT_END_APP, _
                        varBackEndDbOne:=THE_BACK_END_DB1
    End If

End Function

Public Function getMyDate() As String
    On Error GoTo 0
    getMyDate = gstrDATE_FMSQUERY
End Function

Public Function getMyVersion() As String
    On Error GoTo 0
    getMyVersion = gstrVERSION_FMSQUERY
End Function

Public Function getMyProject() As String
    On Error GoTo 0
    getMyProject = gstrPROJECT_FMSQUERY
End Function

Public Sub FMSQUERY_EXPORT(Optional ByVal varDebug As Variant)

    Const THE_FRONT_END_APP = True
    Const THE_SOURCE_FOLDER = ".\src\"
    Const THE_XML_FOLDER = ".\src\xml\"
    Const THE_XML_DATA_FOLDER = ".\src\xmldata\"
    Const THE_BACK_END_SOURCE_FOLDER = "NONE"            ' ".\srcbe\"
    Const THE_BACK_END_XML_FOLDER = "NONE"               ' ".\srcbe\xml\"
    Const THE_BACK_END_DB1 = "NONE"                      ' "C:\DBPROJECT\PROJECT\PROJECT_DATA.accdb"

    On Error GoTo PROC_ERR

    'Debug.Print "THE_BACK_END_DB1 = " & THE_BACK_END_DB1
    If Not IsMissing(varDebug) Then
        aegitClassTest varDebug:="varDebug", varSrcFldr:=THE_SOURCE_FOLDER, varSrcFldrBe:=THE_BACK_END_SOURCE_FOLDER, _
                        varXmlFldr:=THE_XML_FOLDER, varXmlDataFldr:=THE_XML_DATA_FOLDER, _
                        varFrontEndApp:=THE_FRONT_END_APP, _
                        varBackEndDbOne:=THE_BACK_END_DB1
    Else
        aegitClassTest varSrcFldr:=THE_SOURCE_FOLDER, varSrcFldrBe:=THE_BACK_END_SOURCE_FOLDER, _
                        varXmlFldr:=THE_XML_FOLDER, varXmlDataFldr:=THE_XML_DATA_FOLDER, _
                        varFrontEndApp:=THE_FRONT_END_APP, _
                        varBackEndDbOne:=THE_BACK_END_DB1
    End If

PROC_EXIT:
    Exit Sub

PROC_ERR:
    MsgBox "Erl=" & Erl & " Error " & Err.Number & " (" & Err.Description & ") in procedure FMSQUERY_EXPORT"
    Resume Next

End Sub

'
'
'=============================================================================================================================
' Tasks:
' #005 -
' #004 -
' #003 -
' #002 -
' #001 - Setup for inital aegit export
'=============================================================================================================================
'
'
'20190205 - v001 - First version
    ' First commit