////////////////////////////////////////////////////////////////////////////////
//
// ��Ŀ:
// ģ��: �Զ�������Ŀ
// ����: ������ ����ʱ��: 2008-12-7
//
//
// �޸�:       
//
//
//
////////////////////////////////////////////////////////////////////////////////
unit AntManageClientfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseChildfrm, StdCtrls, ExtCtrls, DBCtrls, Buttons, ActnList,
  ComCtrls, Grids, DBGrids, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, DB, DBClient,
  ClientTypeUnits, Mask;

type

  TAntManageClientDlg = class(TBaseChildDlg)
    actlst1: TActionList;
    act_BuildProject: TAction;
    pgcAnt: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    dbtxtZNAME: TDBText;
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    scrlbx1: TScrollBox;
    spl1: TSplitter;
    pnl3: TPanel;
    btnBuildProject: TBitBtn;
    act_ProAdd: TAction;
    btnProAdd: TBitBtn;
    idtcpclnt1: TIdTCPClient;
    cdsAntList: TClientDataSet;
    dsAntList: TDataSource;
    lbl1: TLabel;
    dbedtZNAME: TDBEdit;
    lbl2: TLabel;
    dbedtZPRO_ID: TDBEdit;
    lbl3: TLabel;
    dbedtZIP: TDBEdit;
    lbl4: TLabel;
    dbedtZPYFILE: TDBEdit;
    btnProSave: TBitBtn;
    btnProCancel: TBitBtn;
    act_ProSave: TAction;
    act_ProCancel: TAction;
    cdstemp: TClientDataSet;
    dbmmoZREMARK: TDBMemo;
    lbl5: TLabel;
    act_BuildConnectIP: TAction;
    btnBuildConnectIP: TBitBtn;
    act1_BuildInfo: TAction;
    btn1_BuildInfo: TBitBtn;
    lbl6: TLabel;
    dbedtZDATE: TDBEdit;
    lbl7: TLabel;
    dbedtZVERSION: TDBEdit;
    lbl8: TLabel;
    dbedtZSVN: TDBEdit;
    lblError: TLabel;
    lstResult: TListBox;
    ani1: TAnimate;
    procedure act_ProAddExecute(Sender: TObject);
    procedure cdsAntListNewRecord(DataSet: TDataSet);
    procedure act_ProSaveUpdate(Sender: TObject);
    procedure act_ProCancelUpdate(Sender: TObject);
    procedure act_ProSaveExecute(Sender: TObject);
    procedure act_ProCancelExecute(Sender: TObject);
    procedure cdsAntListBeforePost(DataSet: TDataSet);
    procedure act_BuildConnectIPExecute(Sender: TObject);
    procedure act_BuildProjectUpdate(Sender: TObject);
    procedure cdsAntListAfterScroll(DataSet: TDataSet);
    procedure act1_BuildInfoExecute(Sender: TObject);
    procedure act_BuildProjectExecute(Sender: TObject);
    procedure act1_BuildInfoUpdate(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcAntChanging(Sender: TObject; var AllowChange: Boolean);
    procedure lstResultDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
    function initconnection():Boolean; //���ӷ�����
    procedure LoadAnt();
  public
    { Public declarations }


    procedure initBase; override;
    procedure freeBase; override;
    procedure Showfrm ; override;  //��ʾ�������¼�
    procedure Closefrm; override;  //�ر���ʾ�������¼�
    class function GetModuleID : integer;override;
  end;

  TPySvnThread = class(TThread)
  private
    fResultStr : string;
    fcds : TClientDataSet;
    fani : TAnimate;
    fMemo: TListBox;
    fIdTCP : TIdTCPClient;
    PyFileName : string;
    fAction : TAction;

    procedure BeginAnimate();
    procedure EndAnimate();
  public
    constructor Create(Acds:TClientDataSet;Aani: TAnimate;
      AMemo:TListBox;AIdTCP: TIdTCPClient;AAction:TAction);
  protected
    procedure Execute;override;
  end;


var
  fPySvning : Boolean;

implementation
uses
  ClinetSystemUnits, Mainfrm;

{$R *.dfm}

{ TAntManageClientDlg }

procedure TAntManageClientDlg.Closefrm;
begin
  inherited;

end;

procedure TAntManageClientDlg.freeBase;
begin
  inherited;

end;

class function TAntManageClientDlg.GetModuleID: integer;
begin
  Result := Ord(mtAnt);
end;

procedure TAntManageClientDlg.initBase;
var
  mycds : TClientDataSet;
  myfield : TFieldDef;
const
  glSQL1 = 'select * from TB_ANT where 1=0 ';
begin
  inherited;
  fPySvning := False;
  ani1.ResName := 'MOV';
  mycds := TClientDataSet.Create(nil);
  try
    mycds.data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL1));

    if cdsAntList.Active then
      cdsAntList.Close;
    cdsAntList.FieldDefs.Clear;
    cdsAntList.FieldDefs.Assign(mycds.FieldDefs);
    with cdsAntList.FieldDefs do
    begin
      myField := AddFieldDef;
      myField.Name := 'ZISNEW';   //�Ƿ�������
      myField.DataType := ftBoolean;

      myField := AddFieldDef;
      myField.Name := 'ZAUTOID';   
      myField.DataType := ftInteger;

      myField := AddFieldDef;
      myField.Name := 'ZINDEX';
      myField.DataType := ftString;
    end;
    cdsAntList.CreateDataSet;

    LoadAnt();
    
  finally
    mycds.Free;
  end;
end;

function TAntManageClientDlg.initconnection:Boolean;
var
  myip : string;
  myport : Integer;
  mystr : string;
begin
  //
  Result := False;
  mystr := cdsAntList.FieldByName('ZIP').AsString;
  if Pos(':',mystr) = 0 then Exit;

  myip := Copy(mystr,1,Pos(':',mystr)-1);
  myport := StrToIntDef(Copy(mystr,Pos(':',mystr)+1,MaxInt),-1);
  if myport = -1 then Exit;

  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;

  try
    idtcpclnt1.Host := myip;
    idtcpclnt1.Port := myport;
    idtcpclnt1.Connect();
    Result := idtcpclnt1.Connected;
  except
    Exit;
  end;
end;

procedure TAntManageClientDlg.Showfrm;
begin
  inherited;

end;

procedure TAntManageClientDlg.act_ProAddExecute(Sender: TObject);
begin
  //
  if cdsAntList.State in [dsEdit,dsInsert] then
    cdsAntList.Post;
  cdsAntList.Append;
  pgcAnt.ActivePageIndex := 1;

end;

procedure TAntManageClientDlg.cdsAntListNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZGUID').AsString := NewGuid;
  DataSet.FieldByName('ZISNEW').AsBoolean := True;
end;

procedure TAntManageClientDlg.act_ProSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProCancelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := cdsAntList.State in [dsEdit,dsInsert];
end;

procedure TAntManageClientDlg.act_ProSaveExecute(Sender: TObject);
begin
  cdsAntList.Post;
end;

procedure TAntManageClientDlg.act_ProCancelExecute(Sender: TObject);
begin
  cdsAntList.Cancel;
end;

procedure TAntManageClientDlg.LoadAnt;
var
  i,myc : Integer;
  myb : Boolean;
const
  glSQL = 'select * from TB_ANT order by ZID desc';

begin
  //
  myb := fLoading;
  fLoading := True;
  cdsAntList.DisableControls;
  try
    while not cdsAntList.Eof do
      cdsAntList.Delete;
      
    cdstemp.Data := ClientSystem.fDbOpr.ReadDataSet(PChar(glSQL));
    cdstemp.First;
    myc := 1;
    while not cdstemp.Eof do
    begin
      cdsAntList.Append;
      cdsAntList.FieldByName('ZISNEW').AsBoolean := False;
      cdsAntList.FieldByName('ZINDEX').AsString := inttostr(myc);Inc(myc);
      for i:=0 to cdstemp.Fields.Count -1 do
      begin
        if  cdstemp.Fields[i].FieldName = 'ZID' then
        begin
          cdsAntList.FieldByName('ZAUTOID').AsInteger :=
            cdstemp.FieldByName('ZID').AsInteger;
        end
        else begin
          cdsAntList.FieldByName(cdstemp.Fields[i].FieldName).AsVariant :=
            cdstemp.FieldByName(cdstemp.Fields[i].FieldName).AsVariant;
        end;
      end;
      cdstemp.Next;
      cdsAntList.Post;
    end;

    cdsAntList.First;
  finally
    cdsAntList.EnableControls;
    fLoading := myb;
  end;
end;


procedure TAntManageClientDlg.cdsAntListBeforePost(DataSet: TDataSet);
var
  mySQL : string;
const
  gl_SQL1 = 'insert TB_ANT(ZGUID,ZNAME,ZPRO_ID,ZIP,ZPYFILE,ZREMARK,ZDATE,ZSVN,ZVERSION)' +
       ' values(''%s'',''%s'',%d,''%s'',''%s'',''%s'',''%s'',%d,''%s'')';
  gl_SQL2 = 'update TB_ANT set ZNAME=''%s'',ZPRO_ID=%d,ZIP=''%s'',ZPYFILE=''%s'', ' +
      'ZREMARK=''%s'',ZDATE=''%s'',ZSVN=%d,ZVERSION=''%s'' where ZGUID=''%s''';
begin
  if fLoading then Exit;
  
  if DataSet.FieldByName('ZISNEW').AsBoolean then
  begin
    mySQL := Format(gl_SQL1,[
      DataSet.FieldByName('ZGUID').AsString,
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));

    DataSet.FieldByName('ZISNEW').AsBoolean := False;
  end
  else begin
    mySQL := Format(gl_SQL2,[
      DataSet.FieldByName('ZNAME').AsString,
      DataSet.FieldByName('ZPRO_ID').AsInteger,
      DataSet.FieldByName('ZIP').AsString,
      DataSet.FieldByName('ZPYFILE').AsString,
      DataSet.FieldByName('ZREMARK').AsString,
      DataSet.FieldByName('ZDATE').AsString,
      DataSet.FieldByName('ZSVN').AsInteger,
      DataSet.FieldByName('ZVERSION').AsString,
      DataSet.FieldByName('ZGUID').AsString]);
    ClientSystem.fDbOpr.ExeSQL(PChar(mySQL));
  end;
end;

procedure TAntManageClientDlg.act_BuildConnectIPExecute(Sender: TObject);
begin
  //
  if not initconnection() then
  begin
    MessageBox(Handle,'���ӱ���������������������Ա��ϵ��','����',
      MB_ICONWARNING+MB_OK);
  end;
end;

procedure TAntManageClientDlg.act_BuildProjectUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected;
end;

procedure TAntManageClientDlg.cdsAntListAfterScroll(DataSet: TDataSet);
begin
  if idtcpclnt1.Connected then
    idtcpclnt1.Disconnect;
end;

procedure TAntManageClientDlg.act1_BuildInfoExecute(Sender: TObject);
var
  i,j,count : integer;
  linenum :Integer; //Ҫ�������к�
  mystr : string;
  myverstr,mys : string;
  myver : Integer;
begin
  idtcpclnt1.WriteLn('A');
  count := idtcpclnt1.ReadInteger;
  if count = -1 then
  begin
    lstResult.Items.Add('��û�б�����ɣ����Ժ�...');
    Exit;
  end;

  lstResult.Items.Clear;

  linenum := 0;
  for i:=0 to count -1 do
  begin
    mystr := idtcpclnt1.ReadLn();
    if (Pos('FATA',UpperCase(mystr)) + Pos('ERROR',UpperCase(mystr)) > 0)  then
    begin
      lblError.Visible := True;
      lblError.Caption := Format('�����������%d��',[i+1]);
      lblError.Hint := mystr;
      linenum := i;
    end
    else if Pos('[<Revision kind=number',mystr) > 0 then
    begin
      //[<Revision kind=number 5>]
      myverstr := Copy(mystr,Pos('=number',mystr)+length('=number'),Pos('>]',mystr));
      mys := '';
      myverstr := Trim(myverstr);
      for j:=1 to Length(myverstr) do
      begin
        if myverstr[j] in ['0','1','2','3','4','5','6','7','8','9'] then
          mys := mys + myverstr[j]
        else
          Break;
      end;
      myver := StrToIntdef(mys,-1);

      //����svn �汾
      if cdsAntList.FieldByName('ZSVN').AsInteger <> myver then
      begin
        if not (cdsAntList.State in [dsEdit,dsInsert]) then
          cdsAntList.Edit;
        cdsAntList.FieldByName('ZSVN').AsInteger := myver;
        cdsAntList.Post;
      end;
    end;
    lstResult.Items.Add(mystr);

  end;
  lstResult.ItemIndex := linenum;
  lstResult.Tag := linenum;

end;

procedure TAntManageClientDlg.act_BuildProjectExecute(Sender: TObject);
var
  MyThread : TPySvnThread;
begin
  MyThread := TPySvnThread.Create(cdsAntList,ani1,lstResult,idtcpclnt1,
    MainDlg.actMod_Ant);
  MyThread.Resume;
end;

procedure TAntManageClientDlg.act1_BuildInfoUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := idtcpclnt1.Connected and
  not fPySvning;
end;

procedure TAntManageClientDlg.dbgrd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsAntList.RecNo mod 2  = 0) and not ( gdSelected in State)  then
    dbgrd1.Canvas.Brush.Color := clSilver;

  dbgrd1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAntManageClientDlg.pgcAntChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if cdsAntList.State in [dsEdit,dsInsert] then
  begin
    AllowChange := False;
    MessageBox(Handle,'�������޸ģ���㱣���ȡ����','��ʾ',MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if fPySvning then
  begin
    AllowChange := False;
    MessageBox(Handle,'�����У������л�ҳ�档','��ʾ',MB_ICONWARNING+MB_OK);
    Exit;
  end;
end;

{ TPySvnThread }

procedure TPySvnThread.BeginAnimate;
begin
  fani.Visible := True;
  fani.Active := True;
  fPySvning := True;
  fMemo.Items.Clear;
  fMemo.Items.Add(#13#10);
  fMemo.Items.Add('  ���ڱ�����...');
  PyFileName := Format('C%s',[fcds.FieldByName('ZPYFILE').AsString]);
  fAction.ImageIndex := 12;
  Application.ProcessMessages;
end;

constructor TPySvnThread.Create(Acds:TClientDataSet;Aani: TAnimate;
  AMemo:TListBox;AIdTCP: TIdTCPClient;AAction:TAction);
begin
  inherited Create(false);
  fcds := Acds;
  fani := Aani;
  fMemo := AMemo;
  fIdTCP := AIdTCP;
  fAction := AAction;
  Self.Priority := tpNormal;
  Self.FreeOnTerminate := True;
end;

procedure TPySvnThread.EndAnimate;
begin
  fMemo.Items.Clear;
  fMemo.Items.Add(fResultStr);
  if not (fcds.State in [dsEdit,dsInsert]) then
    fcds.Edit;
  fcds.FieldByName('ZDATE').AsDateTime := ClientSystem.fDbOpr.GetSysDateTime;
  fcds.Post;
  fani.Active  := False;
  fani.Visible := False;
  fPySvning    := False;
  fAction.ImageIndex := 11;
end;

procedure TPySvnThread.Execute;
begin
  if Terminated then Exit;
  try
    fResultStr := '';
    Synchronize(BeginAnimate);
    fIdTCP.WriteLn(PyFileName);
    fResultStr := fIdTCP.ReadLn();
  finally
    Synchronize(EndAnimate);
  end;
end;

procedure TAntManageClientDlg.lstResultDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  lstResult.Canvas.FillRect(Rect);
  lstResult.Canvas.TextOut(Rect.Left,Rect.Top ,IntToStr(index+1));
  lstResult.Canvas.Font.Color := clBlack;
  if (lstResult.Tag > 0) and (lstResult.ItemIndex = index) then
    lstResult.Canvas.Font.Color := clRed;
  lstResult.Canvas.TextOut(rect.Left+50,Rect.Top,lstResult.Items[index]);
end;

end.