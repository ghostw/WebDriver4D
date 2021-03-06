unit TestWebDriver;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, System.Classes, System.SysUtils, JsonDataObjects, WebDriver4D,
  WD_http,wd_httpDelphi;

type
  // Test methods for class TPhantomjs

  TestTWebDriver = class(TTestCase)
  strict private
    procedure StartIEDriver;
    procedure LoginWeibo;
    procedure StartChromeDriver;
    procedure StartFireFox;
    procedure StartPhantomjs;
  private
  strict protected
    FCMD: TDelphiCommand;
    FWD: TWebDriver;
  public
    procedure CheckHasError;
    procedure TestCloseWindow;
    procedure TestFindElementByID;
    procedure TestFindElementByTag;
    procedure TestFindElementByClassName;
    procedure TestFindElement;
    procedure TestFindElements;
    procedure TestFindElementByLinkText;
    procedure TestFindElementByXPath;
    procedure TestGetCurrentWindowHandle;
    procedure TestGetElementAttribute;
    procedure TestSave_screenshot;
    procedure TestSet_Window_Size;
    procedure TestElementClick;
    procedure TestElement_Location;
    procedure TestElement_ScreenShort;
    procedure TestElement_Size;
    procedure TestFindElementsByXPath;
    procedure TestFindElementsByTag;
    procedure TestFindElementsByLinkText;
    procedure TestFindElementsByID;
    procedure TestFindElementsByClassName;
    procedure TestGetAllSession;
    procedure TestGet_AllCookies;
    procedure TestQuit;
    procedure TestRefresh;
    procedure TestTerminatePhantomjs;
    procedure TestClearAll;
    procedure TestStartIEDriver;
  published
    procedure TestClearAllSession;
    procedure TestDeleteSession;
    procedure TestExecuteScript;
    procedure TestExecuteASyncScript;
    procedure TestGetAllCookies;
    procedure TestGetURL;
    procedure TestNewSession;
    procedure TestScreenShot;
    procedure TestGetElement;
    procedure TestGetElementAttribute_InnerHTML;
    procedure TestGetElements;
    procedure TestImplicitly_Wait;
    procedure TestLoginWeibo;
    procedure TestMail163;
    procedure TestSaveElementScreen;
    procedure TestSendKey;
    procedure TestSetWindowSize;
  end;
  // Test methods for class TBrowserCMD

  TestTBrowserCMD = class(TTestCase)
  strict private
    FCMD: TDriverCommand;
  private
    FQJSON: TJsonObject;
  public
    function NewSession: string;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestExecuteDelete;
    procedure TestExecuteGet;
    procedure TestExecutePost;
  end;

  TestTIEDriver = class(TestTWebDriver)
  strict private
    procedure StartIEDriver;
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
  end;

type
  TestFirefoxDriver = class(TestTWebDriver)
  strict private
    procedure StartFireFox;
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
  end;

  TestChromeDriver = class(TestTWebDriver)
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestStartChromeDriver;
    procedure StartChromeDriver;
  end;

  TestEdgeDriver = class(TestTWebDriver)
  private
    FCMD: TDelphiCommand;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure StartEdgeDriver;
    procedure TestMail163;
    procedure TestYouDao;
  end;

  TestPhantomjsDriver = class(TestTWebDriver)
  strict private
    procedure StartPhantomjs;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestExecutePhantomjsScript;
    procedure TestYouDao;
  end;

implementation

uses
  Vcl.Imaging.pngimage;

procedure TestTWebDriver.CheckHasError;
begin
  CheckEquals(FWD.HasError, false, FWD.ErrorMessage);
end;

procedure TestTWebDriver.StartIEDriver;
begin
  FWD :=TWebDriver.Create(nil);
  FWD.Port :=8080;
  FWD.LogFile :='d:\webdriver\ie_log.log';
  FWD.StartDriver('..\WebDriver\IEDriverServer_x86.exe');
end;

procedure TestTWebDriver.LoginWeibo;
var
  hand: string;
  Ele: TWebElement;
  Count: integer;
begin
  Sleep(500);

  FWD.Implicitly_Wait(3000);

  FWD.Set_Window_Size(1920, 1080);

  FWD.GetURL('https://passport.weibo.cn/signin/login?entry=mweibo');

  // Sleep(3000);

  // ele :=FWD.FindElementsByXPath('//div[@class="card card9 line-around" and @data-act-type="hover"]');

  Ele := FWD.FindElementByID('loginName');

  Ele.SendKey( 'test@sina.cn');

  Ele := FWD.FindElementByID('loginPassword');

  Ele.SendKey( 'weibopassword');

  Ele := FWD.FindElementByID('loginAction');
  Ele.Click();

end;

procedure TestTWebDriver.StartChromeDriver;
begin
  FWD :=TChromeDriver.Create(nil);
  FWD.Port :=6666;
  FWD.StartDriver('..\..\..\WebDriver\ChromeDriver.exe');
end;

procedure TestTWebDriver.StartFireFox;
begin
  fwd.LogFile :='d:\webdriver\firefox_log.log';
  FWD.StartDriver('..\..\..\webdriver\geckodriver_x86.exe');
end;

procedure TestTWebDriver.StartPhantomjs;
begin
  FWD :=TPhantomjs.Create(nil);
  FWD.LogFile :='e:\temp\phantomjs_log.log';
  FWD.Address :='127.0.0.1';
  FWD.StartDriver('D:\webdriver\Phantomjs.exe');

end;

procedure TestTWebDriver.TestClearAllSession;
var
  AllSession: string;
  Json: TJsonArray;
  Session: string;
  I: integer;
begin

  AllSession := FWD.GetAllSession;
  Json := TJsonArray.Create;
  try
  
      Json.FromJSON(AllSession);
      for I := 0 to Json.Count - 1 do
      begin
        Session := Json.O[I].S['id'];
        FWD.CloseWindow(Session);
        FWD.DeleteSession(Session);
      end;
   
  finally
    FreeAndnil(Json);
  end;
end;

procedure TestTWebDriver.TestDeleteSession;
begin
  FWD.DeleteSession;
end;

procedure TestTWebDriver.TestExecuteScript;
var
  xxx: string;
begin
  FWD.Clear;
  FWD.NewSession;
  FWD.Set_Window_Size(1366, 768);
  FWD.Implicitly_Wait(3000);
  FWD.GetURL('https://passport.weibo.cn/signin/login');
  // FWD.ExecuteScript('document.getElementById("loginPassword").value="12121212"');
  // xxx := FWD.ExecuteScript('return document.title');
  xxx := FWD.ExecuteScript('return document.body.innerHTML');

  FWD.ScreenShot('..\temp.png');
end;

procedure TestTWebDriver.TestGetAllCookies;
var
  Element: TWebElement;
  enabled: string;
  Cookies: string;
  lst: TStringList;
  state: string;
begin

  Sleep(500);

  //FWD.NewSession;

  // FWD.Set_Window_Size(1366, 768);

  FWD.GetURL('http://www.weibo.com');
  FWD.Set_Window_Size(1366, 768);

  FWD.Implicitly_Wait(1500);

  Element := FWD.FindElementByID('loginname');
  if not Element.IsEmpty then
  begin

    Element.SendKey( 'weiboaddress');
    Element := FWD.FindElementByXPath
      ('//input[@type="password" and @node-type="password"]');

    Element.SendKey( 'aaaa');
    Element := FWD.FindElementByXPath
      ('//a[@action-type="btn_submit" and @node-type="submitBtn" ]');
    if element.AttributeValue('enabled') = 'true' then
    begin
      element.Click();
    end;

  end;

  Cookies := FWD.GetAllCookie;
  try
    lst := TStringList.Create;
    lst.Text := Cookies;
    lst.SaveToFile('..\..\weibo_allcookies.txt');
  finally
    FreeAndnil(lst);
  end;

end;

procedure TestTWebDriver.TestGetURL;
begin
  FWD.Clear;
  FWD.NewSession;
  FWD.Set_Window_Size(1366, 768);
  FWD.GetURL('http://m.weibo.cn');
end;

procedure TestTWebDriver.TestNewSession;
begin
  FWD.Clear;
  FWD.NewSession;
end;

procedure TestTWebDriver.TestScreenShot;
var
  hand: string;
  Ele: TWebElement;
  Json: TJsonObject;
  Count: integer;
begin

  Sleep(500);
  //FWD.NewSession;
  FWD.Set_Window_Size(1920, 1080);
  FWD.GetURL('https://passport.weibo.cn/signin/login?entry=mweibo');
  Sleep(3000);

  Ele := FWD.FindElementByXPath('//div[@class="card card9 line-around" and @data-act-type="hover"]');
  FWD.Implicitly_Wait(3000);
  Ele := FWD.FindElementByID('loginName');
  Ele.SendKey('test@sina.cn');
  Ele := FWD.FindElementByID('loginPassword');
  Ele.SendKey( 'aaa');
  Ele := FWD.FindElementByID('loginAction');
  Ele.Click();

  FWD.ScreenShot('..\..\test.png');

end;

procedure TestTWebDriver.TestGetElement;
var
  Element: TWebElement;
begin
  Sleep(500);
  FWD.Clear;
  FWD.NewSession;
  FWD.Set_Window_Size(1366, 768);
  FWD.GetURL('https://passport.weibo.cn/signin/login?entry=mweibo');
  FWD.Implicitly_Wait(3000);
  Element := FWD.FindElementByID('loginName');
  CheckFalse(Element.IsEmpty);
  CheckHasError;
end;

procedure TestTWebDriver.TestGetElements;
var
  divs: TWebElements;
  I: integer;
  Item: TJsonObject;
  Element: TWebElement;
begin
  FWD.Clear;
  FWD.NewSession;
  FWD.Set_Window_Size(1366, 768);
  FWD.GetURL('http://www.weibo.com');
  Sleep(3000);

  Element := FWD.FindElementByID('loginname');
  if Element.IsEmpty then
  begin
    Element.SendKey('test@sina.cn');
    Element := FWD.FindElementByXPath
      ('//input[@type="password" and @node-type="password"]');

    Element.SendKey( 'aaa');
    Element := FWD.FindElementByXPath
      ('//a[@action-type="btn_submit" and @node-type="submitBtn" ]');
    if Element.AttributeValue( 'enabled') = 'true' then
    begin

      Element.Click;
    end;
  end;
  Sleep(5000);
  divs := FWD.FindElementsByXPath('//div[@action-type="feed_list_item"]');
  for I := 0 to divs.Count - 1 do
  begin
    Element :=divs.Items[I];
    FWD.ScreenShot( 'E:\temp\' + inttostr(I) + '.png');
  end;
end;

procedure TestTWebDriver.TestLoginWeibo;
var
  Element: TWebElement;
  enabled: string;
  SessionID: string;
begin
  Sleep(500);

  FWD.TimeOut := 120 * 1000;
  FWD.Clear;
  SessionID := FWD.NewSession;
  FWD.PageLoadTimeout(90 * 1000);
  CheckHasError;
  // FWD.Set_Window_Size(1366, 768);

  FWD.GetURL('http://www.weibo.com');
  CheckHasError;
  FWD.Set_Window_Size(1366, 768);
  CheckHasError;
  Sleep(3000);
  Element := FWD.FindElementByID('loginname');
  CheckHasError;
  if Element.IsEmpty then
  begin

    Element.SendKey( 'test@sina.cn');
    CheckHasError;
    Element := FWD.FindElementByXPath
      ('//input[@type="password" and @node-type="password"]');
    CheckHasError;

    Element.SendKey( 'aaaa');
    CheckHasError;
    Element := FWD.FindElementByXPath
      ('//a[@action-type="btn_submit" and @node-type="submitBtn" ]');
    CheckHasError;
    if Element.AttributeValue( 'enabled') = 'true' then
    begin
      FWD.Set_Window_Size(1366, 768);
      CheckHasError;
      Element.Click;
      CheckHasError;
    end;

  end;

  FWD.ScreenShot('e:\temp\weibo.png');

end;

procedure TestTWebDriver.TestSaveElementScreen;
var
  Element: TWebElement;
begin
  Sleep(500);
  FWD.Clear;
  FWD.NewSession;

  FWD.Set_Window_Size(1366, 768);

  FWD.GetURL('http://www.weibo.com');

  Sleep(5000);
  FWD.Implicitly_Wait(3000);

  Element := FWD.FindElementByXPath('//div[@class="W_unlogin_v4"]');
  Element.ScreenShot( 'e:\temp\login.png');
end;

procedure TestTWebDriver.TestSendKey;
var
  Element: TWebElement;
begin
  Sleep(500);
  FWD.Clear;
  FWD.NewSession;


  FWD.Set_Window_Size(1366, 768);


  FWD.GetURL('https://passport.weibo.cn/signin/login?entry=mweibo');

  Sleep(3000);

  Element := FWD.FindElementByID('loginName');
  Element.SendKey( 'test@sina.cn');
  Element := FWD.FindElementByID('loginPassword');
  Element.SendKey( 'aaa');
  Element := FWD.FindElementByID('loginAction');
  Element.Click;
  Sleep(3000);
  FWD.ScreenShot('..\..\weibo.png');

end;

procedure TestTWebDriver.TestSetWindowSize;
begin
  FWD.Clear;
  FWD.NewSession;
  FWD.Set_Window_Size(1366, 768);
end;

procedure TestTWebDriver.TestCloseWindow;
var
  ParamSessionID: string;
begin
  // TODO: Setup method call parameters
  FWD.CloseWindow(ParamSessionID);
  CheckEquals(FWD.HasError, false, FWD.ErrorMessage);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementByID;
var
  Element: TWebElement;
  ID: string;
begin
  // TODO: Setup method call parameters
  //Element := FWD.FindElementByID(ID);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementByTag;
var
  Element: TWebElement;
  TagName: string;
begin
  // TODO: Setup method call parameters
  //Element := FWD.FindElementByTag(TagName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementByClassName;
var
  Element: TWebElement;
  ClasName: string;
begin
  // TODO: Setup method call parameters
  //Element := FWD.FindElementByClassName(ClasName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElement;
var
  WebElement: TWebElement;
  KeyName: string;
  usingName: string;
begin
  // TODO: Setup method call parameters
  //WebElement := FWD.FindElement(usingName, KeyName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElements;
var
  Elements: TWebElements;
  KeyName: string;
  usingName: string;
begin
  // TODO: Setup method call parameters
  //Elements := FWD.FindElements(usingName, KeyName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementByLinkText;
var
  Element: TWebElement;
  LinkText: string;
begin
  // TODO: Setup method call parameters
  Element := FWD.FindElementByLinkText(LinkText);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementByXPath;
var
  WebElement: TWebElement;
  XPath: string;
begin
  // TODO: Setup method call parameters
  WebElement := FWD.FindElementByXPath(XPath);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestGetCurrentWindowHandle;
var
  ReturnValue: string;
begin
  ReturnValue := FWD.GetCurrentWindowHandle;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestGetElementAttribute;
var
  ReturnValue: string;
  attributename: string;
  Element: TWebElement;
begin
  // TODO: Setup method call parameters
  // Element.AttributeValue( attributename);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestSave_screenshot;
var
  FileName: string;
begin
  // TODO: Setup method call parameters
  //FWD.ScreenShot(FileName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestSet_Window_Size;
var
  WindowHandle: string;
  Height: integer;
  Width: integer;
begin
  // TODO: Setup method call parameters
  FWD.Set_Window_Size(Width, Height, WindowHandle);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestElementClick;
var
  Element: TWebElement;
begin
  // TODO: Setup method call parameters
  Element.Click;

  // TODO: Validate method results
end;

procedure TestTWebDriver.TestElement_Location;
var
  Location: string;
  Element: TWebElement;
begin
  // TODO: Setup method call parameters
  Location := Element.Location;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestElement_ScreenShort;
var
  FileName: string;
  Element: TWebElement;
begin
  // TODO: Setup method call parameters
  Element.ScreenShot( FileName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestElement_Size;
var
  ReturnValue: string;
  Element: TWebElement;
begin
  // TODO: Setup method call parameters
  //element.Size
  //ReturnValue := FWD.Element_Size(Element);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementsByXPath;
var
  Elements: TWebElements;
  XPath: string;
begin
  // TODO: Setup method call parameters
  //Elements := FWD.FindElementsByXPath(XPath);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementsByTag;
var
  Elements: TWebElements;
  TagName: string;
begin
  // TODO: Setup method call parameters
  //Elements := FWD.FindElementsByTag(TagName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementsByLinkText;
var
  Elements: TWebElements;
  LinkText: string;
begin
  // TODO: Setup method call parameters
  Elements := FWD.FindElementsByLinkText(LinkText);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementsByID;
var
  Elements: TWebElements;
  ID: string;
begin
  // TODO: Setup method call parameters
  //Elements := FWD.FindElementsByID(ID);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestFindElementsByClassName;
var
  Elements: TWebElements;
  ClasName: string;
begin
  // TODO: Setup method call parameters
  //Elements := FWD.FindElementsByClassName(ClasName);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestGetAllSession;
var
  AllSession: string;
begin
  AllSession := FWD.GetAllSession;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestGet_AllCookies;
var
  AllCookie: string;
begin
  AllCookie := FWD.GetAllCookie;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestImplicitly_Wait;
var
  waitTime: Double;
begin
  // TODO: Setup method call parameters
  FWD.Implicitly_Wait(1000);
  FWD.GetURL('http://www.microsoft.com/');
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestQuit;
begin
  FWD.Quit;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestRefresh;
var
  ParamSessionID: string;
begin
  // TODO: Setup method call parameters
  FWD.Refresh(ParamSessionID);
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestTerminatePhantomjs;
begin
  FWD.TerminateWebDriver;
  // TODO: Validate method results
end;

procedure TestTWebDriver.TestClearAll;
begin
  FWD.Clear;
  CheckEquals(FWD.HasError, false, FWD.ErrorMessage);
end;

procedure TestTWebDriver.TestExecuteASyncScript;
var
  script: string;
begin
  //FWD.Set_Window_Size(1366, 768);
  //FWD.Implicitly_Wait(3000);
  FWD.GetURL('https://passport.weibo.cn/signin/login');
  script :=' var text '+
  'text=""; for(var i=0;i<50;i++){'+
  ' text=text';

  FWD.ExecuteScriptByASync(script);

end;

procedure TestTWebDriver.TestGetElementAttribute_InnerHTML;
var
  Element:TWebElement;
  html:string;
begin
  FWD.GetURL('http://www.yahoo.com/');
  Element :=FWD.FindElementByTag('body');
  html :=Element.AttributeValue('innerHTML');

end;

procedure TestTWebDriver.TestMail163;
var
  Element:TWebElement;
begin
  //FWD.Port := 7777;
  Sleep(500);
  FWD.GetURL('http://mail.163.com');
  FWD.SwitchToFrame('x-URS-iframe');
  Sleep(3000);
  Element := FWD.FindElementByXPath('//input[@name="email" and @data-loginname="loginEmail"]');
  Element.SendKey( 'demo');
  Element := FWD.FindElementByXPath('//input[@name="password" and @type="password"]');
  Element.SendKey( 'demo');
  Element := FWD.FindElementByID('dologin');
  Element.Click;
  FWD.Clear;

end;

procedure TestTWebDriver.TestStartIEDriver;
begin

end;

function TestTBrowserCMD.NewSession: string;
const
  NEW_SESSION_PARAM = '{"desiredCapabilities": {"browserName":"phantomjs",' +
    '"phantomjs.page.settings.userAgent": "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36"'
    + ' , "platform": "windows", "version": "", "javascriptEnabled": true},' +
    '"capabilities": {"browserName": "phantomjs", "firstMatch": [],' +
    '"phantomjs.page.settings.userAgent": "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36"'
    + ',"platform": "windows", "alwaysMatch": {}, "javascriptEnabled": true, "version": ""}}';
var
  command: string;
  status: string;
  resp: string;
begin
  command := 'http://127.0.0.1:81/wd/hub/session';

  //resp := FCMD.ExecutePost(command, NEW_SESSION_PARAM);

  FQJSON.Parse(PChar(resp));
  if FQJSON.S['status'] = '0' then
  begin
    result := FQJSON.S['sessionId'];
  end
  else
  begin
    raise Exception.Create('new session error:' + resp);
  end;
end;

procedure TestTBrowserCMD.SetUp;
begin
  FCMD := TDriverCommand.Create(nil);
  FQJSON := TJsonObject.Create;
end;

procedure TestTBrowserCMD.TearDown;
begin
  FreeAndnil(FQJSON);
  FreeAndnil(FCMD);
end;

procedure TestTBrowserCMD.TestExecuteDelete;
var
  command: string;
begin
  // TODO: Setup method call parameters
  FCMD.ExecuteDelete(command);
  // TODO: Validate method results
end;

procedure TestTBrowserCMD.TestExecuteGet;
var
  ReturnValue: string;
  URL: string;
begin
  // TODO: Setup method call parameters
  ReturnValue := FCMD.ExecuteGet(URL);
  // TODO: Validate method results
end;

procedure TestTBrowserCMD.TestExecutePost;
var
  ReturnValue: string;
  Data: string;
  URL: string;
  Session: string;
begin
  // TODO: Setup method call parameters
  // Session :=NewSession;
  // URL:='http://127.0.0.1:81/wd/hub/session/'+Session+'/url';
  URL := 'http://127.0.0.1:81/wd/hub/session/377b8d50-27b4-11e7-bd60-4bd9a6b64703/url';

  Data := '{"url":"http://s.weibo.com/weibo/%25E5%259B%25BD%25E5%258A%25A1%25E9%2599%25A2%25E5%2587%258F%25E7%25A8%258E?topnav=1&wvr=6&b=1","sessionid":"7e893fd0-27b4-11e7-bd60-4bd9a6b64703"}';
  ReturnValue := FCMD.ExecutePost(URL, Data);
  // TODO: Validate method results
end;

procedure TestTIEDriver.SetUp;
begin
  FCMD :=TDelphiCommand.Create(nil);
  StartIEDriver;

end;

procedure TestTIEDriver.TearDown;
begin
  FWD.clear;
  if Assigned(FWD) then
    FreeAndNil(FWD);
  if Assigned(FCMD) then
    FreeAndNil(fCMD);

end;

procedure TestTIEDriver.StartIEDriver;

begin
  FWD :=TIEDriver.Create(nil);
  FWD.Port :=5555;
  FWD.Cmd :=FCMD;
  FWD.StartDriver('..\..\..\WebDriver\IeDriverServer_x86.exe');
  FWD.NewSession();

end;

procedure TestFirefoxDriver.SetUp;
begin
  FCMD :=TDelphiCommand.Create(nil);
  StartFireFox;
  
end;

procedure TestFirefoxDriver.TearDown;
begin
  FWD.Clear;
  if Assigned(FCMD) then
    FreeAndNil(FCMD);
  if Assigned(FWD) then
    FreeAndNil(FWD);
end;

procedure TestFirefoxDriver.StartFireFox;

begin
  FWD :=TFireFoxDriver.Create(nil);
  FWD.Port :=4444;
  FWD.Cmd :=FCMD;
  (FWD as TFireFoxDriver).BrowserFileName := 'C:\Program Files\Mozilla Firefox\firefox.exe';
  FWD.StartDriver('..\..\..\WebDriver\geckodriver_x86.exe');
  FWD.NewSession;
end;

procedure TestChromeDriver.SetUp;
begin
  FCMD :=TDelphiCommand.Create(nil);
  StartChromeDriver;
end;

procedure TestChromeDriver.TearDown;
begin
  FreeAndNil(FWD);
  if Assigned(FCMD) then
    FreeAndNil(FCMD);

end;

procedure TestChromeDriver.TestStartChromeDriver;
var
  Chrome:TChromeDriver;
begin
  Chrome :=TChromeDriver.Create(nil);
  Try
    Chrome.Port :=6666;
    Chrome.StartDriver('..\..\..\WebDriver\ChromeDriver.exe');
    Chrome.NewSession();
  Finally
    FreeAndNil(Chrome);
  End;
end;

procedure TestChromeDriver.StartChromeDriver;
var
  Chrome:TChromeDriver;
begin
  Chrome :=TChromeDriver.Create(nil);
  FWD :=Chrome;
  Chrome.Port :=6666;
  Chrome.Cmd :=FCMD;
  Chrome.StartDriver('..\..\..\WebDriver\ChromeDriver.exe');
  Chrome.NewSession();


end;

procedure TestEdgeDriver.SetUp;
begin
  FCMD :=TDelphiCommand.Create(nil);
  StartEdgeDriver;
end;

procedure TestEdgeDriver.StartEdgeDriver;
var
  Edge:TEdgeDriver;
begin
  FWD :=TEdgeDriver.Create(nil);
  Edge :=FWD as TEdgeDriver;
  Edge.Port :=7777;
  Edge.Cmd :=FCMD;
  Edge.StartDriver('..\..\..\WebDriver\MicrosoftWebDriver.exe');
  Edge.NewSession();
end;

procedure TestEdgeDriver.TearDown;
begin
  FreeAndNil(FWd);
  if Assigned(FCMD) then
    FreeAndNil(FCMD);

end;

procedure TestEdgeDriver.TestMail163;
var
  WD:TEdgeDriver;
  Element:TWebElement;
  Script:string;

begin
  WD := TEdgeDriver.Create(nil);
  try
    WD.Address := 'localhost';
    //WD.Port := 7777;
    WD.StartDriver('d:\webdriver\MicrosoftWebDriver.exe');//路径正确
    WD.Path :='';
    Sleep(500);
    WD.NewSession;
    WD.GetURL('https://mail.163.com');
    WD.SwitchToFrame('x-URS-iframe');


    Sleep(3000);
    Element := WD.FindElementByXPath('//input[@name="email" and @class="j-inputtext dlemail"');
    Element.SendKey( 'demo');
    Element := WD.FindElementByXPath('//input[@name="password" and @type="password"]');
    Element.SendKey( 'demo');
    Element := WD.FindElementByID('dologin');
    Element.Click;
  finally
    FreeAndNil(WD);
  end;
end;

procedure TestEdgeDriver.TestYouDao;
var
  WD:TEdgeDriver;
  Element:TWebElement;
  Script:string;
  Text :string;
begin
  WD := TEdgeDriver.Create(nil);
  try
    WD.Address := 'localhost';
    //WD.Port := 7777;
    WD.StartDriver('d:\webdriver\MicrosoftWebDriver.exe');//路径正确
    WD.Path :='';
    Sleep(500);
    WD.NewSession;
    WD.GetURL('http://fanyi.youdao.com/?keyfrom=dict2.index');

    Element := WD.FindElementByID('inputOriginal');
    Element.SendKey('This is a Book');
    Sleep(2000);
    Element :=Wd.FindElementByID('transTarget');
    Text :=Element.AttributeValue('innerText');
    CheckEquals(Text,'这是一本书');
    Element := WD.FindElementByID('inputDelete');
    Element.Click;

    Element := WD.FindElementByID('inputOriginal');
    Element.SendKey('an Apple a day keeps doctor away.');
    Sleep(2000);
    Element :=Wd.FindElementByID('transTarget');
    Text :=Element.AttributeValue('innerText');
    CheckEquals(Text,'一日一苹果，医生远离我。');


  finally
    FreeAndNil(WD);
  end;
end;

procedure TestPhantomjsDriver.SetUp;
begin
  FCMD :=TDelphiCommand.Create(nil);
  StartPhantomjs;
end;

procedure TestPhantomjsDriver.StartPhantomjs;

begin
  FWD :=TPhantomjs.Create(nil);
  FWD.Port :=8888;
  FWD.StartDriver('D:\WebDriver\Phantomjs.exe');
  FWD.Cmd :=FCMD;
  FWD.NewSession();

end;

procedure TestPhantomjsDriver.TearDown;
begin
  FWD.clear;
  if Assigned(FWD) then
    FreeAndNil(FWD);
  if Assigned(FCMD) then
    FreeAndNil(fCMD);

end;

procedure TestPhantomjsDriver.TestExecutePhantomjsScript;
var
  script:string;
  Ip:string;
  port:Integer;
  Phantomjs:TPhantomjs;
  str:string;

begin
  Ip :='118.163.120.182';
  port := 58837;
  script :=format('phantom.setProxy("%s",%d)',[Ip,port]);
  Phantomjs :=FWD as TPhantomjs;
  str :=Phantomjs.Execute_Phantom_Script(script);
  Phantomjs.GetURL('https://www.baidu.com/s?wd=ip&rsv_spt=1&rsv_iqid=0xd14ff912000052e4&issp=1&f=8&rsv_bp=0&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_sug3=2&rsv_sug2=0&inputT=544&rsv_sug4=544');
  Phantomjs.ScreenShot('e:\temp\agent_test.png');
end;

procedure TestPhantomjsDriver.TestYouDao;
var
  Element:TWebElement;
  Text :string;
begin
  FWD.NewSession;

  FWD.GetURL('http://fanyi.youdao.com/?keyfrom=dict2.index');

  Element := FWD.FindElementByID('inputOriginal');
  Element.SendKey('This is a Book');
  Sleep(2000);
  Element :=FWD.FindElementByID('transTarget');
  Text :=trim(Element.AttributeValue('innerText'));
  CheckEquals(Text,'这是一本书');
  Element := FWD.FindElementByID('inputDelete');
  Element.Click;

  Element := FWD.FindElementByID('inputOriginal');
  Element.SendKey('an Apple a day keeps doctor away.');
  Sleep(2000);
  Element :=FWD.FindElementByID('transTarget');
  Text :=Trim(Element.AttributeValue('innerText'));
  CheckEquals(Text,'一日一苹果，医生远离我。');

end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTBrowserCMD.Suite);
RegisterTest(TestTIEDriver.Suite);
RegisterTest(TestFirefoxDriver.Suite);
RegisterTest(TestChromeDriver.Suite);
RegisterTest(TestEdgeDriver.Suite);
RegisterTest(TestPhantomjsDriver.Suite);

end.
