' Copyright FMS, Inc.  All Rights Reserved.
' Permission for use granted to members of MyFMS (membership is FREE)
'
' Sample code for the FMS Technical Paper on Query Tips and Techniques
' written by Luke Chung, President of FMS, Inc.
' Full details at http://www.fmsinc.com/tpapers/queries/

Option Compare Database
Option Explicit

' Examples of running queries in Access
'   BrowseQuery_DAO           Browse a saved SELECT query using a DAO recordset
'   RunParameterQuery_DAO     Run a query with parameters using DAO
'   RunActionQuery_DAO        Run a stored action query with DAO
'   RecordsetFromSQL_DAO      Use a SQL string to open a recordset
'   RecordsetFromSQL_DAO      Browse a table using an ADO recordset
'   MakeTableFromSQL_DAO      Create a table via a Make Query SQL string

Public Sub BrowseQuery_DAO()
  ' Comments: Browse a query and display its fields in the Immediate Window using DAO
  
  Const cstrQueryName = "Basics: Top 10 Most Profitable Companies"

  Dim dbs As DAO.Database
  Dim rst As DAO.Recordset
  
  ' Open pointer to current database
  Set dbs = CurrentDb
  
  ' Open recordset on saved query
  Set rst = dbs.OpenRecordset(cstrQueryName)

  ' Display data from one record and move to the next record until finished
  Do While Not rst.EOF
    Debug.Print "Company: " & rst![Company] & "   Sales: " & rst![Sales] & "   Sales: " & rst![Profits]
    rst.MoveNext
  Loop

  rst.Close
  dbs.Close

End Sub

Public Sub BrowseTable_ADO()
  ' Comments: Browse a table and display its fields in the Immediate Window using ADO
  
  Const cstrTableName = "Fortune100"

  Dim rst As ADODB.Recordset
  Dim intCompany As Integer
  
  ' Open recordset on saved query
  Set rst = New ADODB.Recordset
  rst.Open cstrTableName, CurrentProject.Connection, adOpenForwardOnly, adLockReadOnly, adCmdTable

  ' Display data from one record and move to the next record until finished
  intCompany = 0
  Do While Not rst.EOF
    intCompany = intCompany + 1
    Debug.Print "#" & intCompany & " " & rst![Company] & "   Sales: " & rst![Sales] & "   Sales: " & rst![Profits]
    rst.MoveNext
  Loop

  rst.Close

End Sub

Public Sub RunParameterQuery_DAO(pstrState As String)
  ' Comments: Runs a query containing parameters
  ' Input   : pstrState      Name of state to select records
  
  Const cstrQueryName As String = "Basics: Parameters"
  Dim dbs As DAO.Database
  Dim qdf As DAO.QueryDef
  Dim rst As DAO.Recordset
  
  Set dbs = CurrentDb()
  Set qdf = dbs.QueryDefs(cstrQueryName)
  qdf.Parameters("State Abbreviation") = pstrState

  ' Open recordset on the query
  Set rst = qdf.OpenRecordset()
  Do While Not rst.EOF
    Debug.Print ("ID: " & rst![ID] & "   State: " & rst![State])
    rst.MoveNext
  Loop

  rst.Close
  qdf.Close
  dbs.Close
End Sub

Public Sub RunActionQuery_DAO(pstrQueryName As String)
  ' Comments: Sample code of running a stored (action) query
  ' Input   : pstrQueryName   Name of saved query to run

  DoCmd.SetWarnings False
    CurrentDb.Execute pstrQueryName
  DoCmd.SetWarnings True

End Sub

Public Sub RecordsetFromSQL_DAO()
  ' Comments: Browse the results of a SQL string using DAO and display its fields in the Immediate Window

  Dim dbs As DAO.Database
  Dim rst As DAO.Recordset
  Dim strSQL As String

  strSQL = "SELECT Left([Company],1) AS Letter, Count(Company) AS [Count], " & _
           "Avg(Sales) AS AvgOfSales, Avg(Profits) AS AvgOfProfits " & _
           "FROM Fortune100 " & _
           "GROUP BY Left([Company],1)"
           
  ' Open pointer to current database
  Set dbs = CurrentDb()
  
  ' Create recordset based on SQL
  Set rst = dbs.OpenRecordset(strSQL)

  Do While Not rst.EOF
    Debug.Print "Company Letter: " & rst![Letter] & "   Sales: " & rst![AvgOfSales] & "   Profits: " & rst![AvgOfProfits]
    rst.MoveNext
  Loop

  rst.Close
  dbs.Close
  
End Sub

Public Sub RecordsetFromSQL_ADO()
  ' Comments: Browse the results of a SQL string using ADO and display its fields in the Immediate Window
  
  Dim strSQL As String
  Dim rst As ADODB.Recordset
  Dim intCompany As Integer
    
  ' Show list of companies by descreasing sales
  strSQL = "SELECT * FROM Fortune100 ORDER BY Sales Desc"
  
  ' Open recordset on saved query
  Set rst = New ADODB.Recordset
  rst.Open strSQL, CurrentProject.Connection, adOpenForwardOnly, adLockReadOnly, adCmdText

  ' Display data from one record and move to the next record until finished
  intCompany = 0
  Do While Not rst.EOF
    intCompany = intCompany + 1
    Debug.Print "#" & intCompany & " " & rst![Company] & "   Sales: " & rst![Sales] & "   Sales: " & rst![Profits]
    rst.MoveNext
  Loop

  rst.Close

End Sub

Public Sub MakeTableFromSQL_DAO()
  ' Comments: Sample code running an action query created in a SQL string
  '           Includes simple error trapping to handle problems creating table
  
  Const cstrNewTableName As String = "Fortune100 LetterSummary"
  Dim strSQL As String
  Dim strError As String

  ' SQL string to create a new table
  strSQL = "SELECT Left([Company],1) AS Letter, Count(Company) AS [Count], " & _
           "Avg(Sales) AS AvgOfSales, Avg(Profits) AS AvgOfProfits " & _
           "INTO [" & cstrNewTableName & "] " & _
           "FROM Fortune100 " & _
           "GROUP BY Left([Company],1)"
  
  ' Delete table if it exists
  On Error Resume Next
  DoCmd.DeleteObject acTable, cstrNewTableName
  
  Err.Clear
  
  ' Execute (run) the query
  CurrentDb.Execute strSQL
  If Err.Number <> 0 Then
    strError = Err.Description
  End If
  
  On Error GoTo 0
  
  If strError = "" Then
    MsgBox "Table: [" & cstrNewTableName & "] created"
    DoCmd.OpenTable cstrNewTableName
  Else
    MsgBox "Error creating table: " & strError
  End If
  
End Sub