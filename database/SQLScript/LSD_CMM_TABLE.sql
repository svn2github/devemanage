/******************************************************************************
*
*         �����ļ�������
*         �ļ�����BFSS_TABLES.SQ  �汾��1.0
*         �������ڣ�2007-11-9    ����:������
*
* 
*   ע��: 
*	��mssql2000��û��boolean�����ͣ�����bit�Ĵ��� 0=False 1=True
*
******************************************************************************/

/*#########################################################
 #
 # �ļ�������
 #
 #########################################################*/

/*�ļ���Ŀ¼�ṹ*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_TREE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_TREE]
go

create table TB_FILE_TREE(
	ZID	int IDENTITY (1, 1) not null, /*ID���Զ��������*/
	ZPID    int not null default -1,      /*�ϼ�ID=-1��ʾ��Ŀ¼ Ĭ��ֵΪ-1 */
	ZNAME	varchar(200) not null,        /*����*/
	ZNOTE	varchar(200),                 /*˵��*/
	ZHASCHILD bit not null,               /*=True��ʾ���¼�*/
	constraint PK_TB_FILE_TREE primary key(ZID)
)
go

/*�ļ��б� TB_FILE_ITEM*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_ITEM]
go

create table TB_FILE_ITEM(
	ZTREE_ID       int not null,           /*��ID*/
	ZID	       int not null,           /*�ļ�id*/
	ZVER           int not null,           /*�ļ��İ汾��*/
	ZNAME          varchar(200) not null,  /*����*/
	ZEDITER_ID     int ,                   /*�༭��*/
        ZFILEPATH      varchar(200),           /*�ļ�·��*/
	ZSTATUS        int not null,           /*״̬ = 0 ��ʾû���˱༭ =1��ʾ�ڱ༭*/	
	ZEXT           varchar(10),            /*�ļ�����չ��*/
	ZEDITDATETIME  datetime,               /*�ļ��༭ʱ��*/
	ZSTRUCTVER     int,                    /*�����ļ��Ľṹ�汾*/
	ZTYPE          int not null,           /*�ļ����� 0=���������ļ�*/
	ZNEWVER        bit not null,           /*�Ƿ������°汾*/
	ZNOTE          text,                   /*�ļ�˵��*/
	ZSIZE          int not null,           /*�ļ���С*/
	constraint PK_TB_FILE_ITEM primary key(ZTREE_ID,ZID,ZVER)
)
go

/*�ļ����� TB_FILE_CONTEXT*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_FILE_CONTEXT]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_FILE_CONTEXT]
go

create table TB_FILE_CONTEXT(
	ZFILE_ID  int not null,  /*�ļ�ID*/
	ZGROUPID  int not null,  /*�ļ����˳���*/
	ZVER      int not null,  /*�ļ��汾*/
	ZSTREAM   image not null, /*�ļ�������*/
	constraint PK_TB_FILE_CONTEXT primary key(ZFILE_ID,ZGROUPID,ZVER)       
)
go

/*�û��б� TB_USER_ITEM */
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_USER_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_USER_ITEM]
go

create table TB_USER_ITEM(
	ZID        int IDENTITY (1, 1) not null,         /*�Զ�������ID*/
	ZNAME      varchar(20) not null,                 /*�û���*/
	ZPASS      varchar(20),                          /*����*/
	ZSTOP      bit,                                  /*�Ƿ����*/
	ZTYPE      int not null,                         /*����=0ϵͳ�û�,����ɾ��*/
	ZEMAIL     varchar(20),                          /*����*/
	ZGROUP_ID  int,                                  /*��ID*/
	ZPRIVGROUP int,                                  /*Ȩ����*/
	constraint PK_TB_USER_ITEM primary key(ZID)       
)
go

/*�û�Ȩ�ޱ� TB_USER_PRIVILEGE */
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_USER_PRIVILEGE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_USER_PRIVILEGE]
go

create table TB_USER_PRIVILEGE(
	ZID            int IDENTITY (1, 1) not null, /*IDֵ*/
	ZUSER_ID       int not null,    /*�û�ID*/
	ZSTYLE         int not null,    /*���� �Ǵ��ģ��*/
	ZSUBSTYLE      int not null,    /*������*/
	ZMODULEID      int not null,    /*ģ��ID�����ļ���Ŀ¼��ID*/
	ZRIGHTMASK     int not null,    /*Ȩ������  1=�鿴 2=�޸� 4=ɾ�� 8=����*/
	constraint PK_TB_USER_PRIVILEGE primary key(ZID,ZUSER_ID,ZSTYLE,ZMODULEID)   
)
go


/*#########################################################
 #
 # ��Ŀ���� 
 #
 #########################################################*/

/*��Ŀ�б�*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PRO_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PRO_ITEM]
go

create table TB_PRO_ITEM(
	ZID            int IDENTITY (1, 1) not null,             /*��ĿID*/
	ZNAME          varchar(200) not null,                    /*��Ŀ����*/
	ZOPENDATE      datetime not null,                        /*��Ŀ��ʼʱ��*/
	ZLASTVER       varchar(50),                              /*��Ŀ�����°汾*/
	ZLASTDATE      datetime,                                 /*��Ŀ������ʱ��*/
	ZMANAGERID     int ,                                     /*��Ŀ�ĸ�����*/
	ZUNITS         varchar(200),                             /*��Ŀ��ʹ�õ�λ*/     
	ZHIGHVERID     int not null default -1,                  /*���°汾�ŵ�IDֵ*/       
	constraint PK_TB_PRO_ITEM primary key(ZID)   
)
go

/*��Ŀ�汾*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_PRO_VERSION]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_PRO_VERSION]
go

create table TB_PRO_VERSION(
	ZID            int IDENTITY (1, 1) not null,             /*�汾ID*/
	ZPRO_ID        int not null,                             /*��ĿID*/
	ZVER           varchar(50) not null,                     /*�汾�Ÿ�ʽ 1.2.5.67*/
	ZUPDATEDATE    datetime,                                 /*����ʱ��*/
	ZCONTEXT       text,                                     /*����˵��*/
	ZMUSTVER       bit,                                      /*�Ƿ��Ǳ�����µİ汾*/
	constraint PK_TB_PRO_VERSION primary key(ZID,ZPRO_ID)   
)
go

/*##########################################################
 #
 # BUG���� 
 #
 ###########################################################*/

/*BUG���ṹ*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_TREE]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_TREE]
go

create table TB_BUG_TREE(
	ZID            int IDENTITY (1, 1) not null,             /*BUG ID*/
	ZPID           int not null,                             /*�ϼ�BUG��ĿID*/
	ZPRO_ID        int not null,                             /*��Ӧ��������Ŀ*/
	ZNAME          varchar(200) not null,                    /*����*/ 
	ZAddDATE       datetime not null,                        /*���ӵ�ʱ��*/
	ZSORT          int not null,                             /*�����*/
	ZHASCHILD      bit not null,                             /*=True��ʾ���¼�*/
	constraint PK_TB_BUG_TREE primary key(ZID)   
)
go

/*BUG�б�*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_ITEM]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_ITEM]
go

create table TB_BUG_ITEM(
	ZID            int  not null,                             /*BUG ID*/
	ZTREE_ID       int  not null,                             /*BUG��ĿID*/
	ZPRO_ID        int  not null,                             /*������Ŀ��ĿID*/
	ZTREEPATH      varchar(200) not null,                     /*��Ŀ·��*/ 
	ZTITLE         varchar(200),                              /*��Ŀ����*/
	ZOS            int  not null,                             /*����ϵͳ*/
	ZTYPE          int,                                       /*��������*/
	ZLEVEL         int  not null,                             /*BUG�ڼ�*/
	ZSTATUS        int  not null,                             /*BUG״̬*/
	ZMAILTO        varchar(200),                              /*�ʼ�������,��#13#10�ֿ�*/
	ZOPENEDBY      int  not null,                             /*BUG������*/
	ZOPENEDDATE    datetime not null,                         /*����ʱ��*/
	ZOPENVER       int not null,                              /*��ʱ������İ汾*/
	ZASSIGNEDTO    int,                                       /*���ɸ�*/
        ZASSIGNEDDATE  datetime,                                  /*����ʱ��*/
	ZRESOLVEDBY    int,                                       /*�����*/
	ZRESOLUTION    int,                                       /*�������*/
	ZRESOLVEDVER   int,                                       /*����İ汾*/
	ZRESOLVEDDATE  datetime,                                  /*�����ʱ��*/
	ZLASTEDITEDBY  int not null,                              /*����޸ĵ���*/
	ZLASTEDITEDDATE datetime not null,                        /*����޸ĵ�ʱ��*/                                  
	
	constraint PK_TB_BUG_ITEM primary key(ZID desc,ZTREE_ID)   
)
go
  --����������޸�����Ϊ���� 
  CREATE  INDEX [TK_BUG_ITEM_LastDate] ON [dbo].[TB_BUG_ITEM]([ZLASTEDITEDDATE] DESC ) ON [PRIMARY]
go

/*BUG�Ļظ���Ϣ*/

if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_HISTORY]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_HISTORY]
go

create table TB_BUG_HISTORY(
	ZID            int IDENTITY (1, 1) not null,             /*�ظ� ID*/
	ZBUG_ID        int not null,                             /*BUG��ID*/
	ZUSER_ID       int not null,                             /*�û�ID*/
	ZSTATUS        int not null,                             /*״̬*/ 
	ZACTIONDATE    datetime not null,                        /*ʱ��*/
	ZCONTEXT       text,                                     /*����*/
	ZANNEXFILE_ID  int                                       /*�������ݣ�������ͼƬ�����ֱ��*/
	constraint PK_TB_BUG_HISTORY primary key(ZID,ZBUG_ID)   
)
go

/*BUG������*/
if exists (select * from dbo.sysobjects
  where id = object_id(N'[dbo].[TB_BUG_PARAMS]')
  and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TB_BUG_PARAMS]
go

create table TB_BUG_PARAMS(
	ZTYPE 	     int not null,                                   /*����*/
	ZID          int not null,                                   /*IDֵ*/
	ZNAME        varchar(200)                                    /*ֵ*/
	constraint PK_TB_BUG_PARAMS primary key(ZTYPE,ZID)  
)
go










