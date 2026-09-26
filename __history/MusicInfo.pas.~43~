unit MusicInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type

  TForm1 = class(TForm)
    lblLogo: TLabel;
    BtnLoad: TButton;
    BtnView: TButton;
    BtnSort: TButton;
    BtnSearch: TButton;
    BtnAdd: TButton;
    BtnDelete: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    shpStatus: TShape;
    lblStatus: TLabel;
    pmLists: TPopupMenu;
    miArtists: TMenuItem;
    miAlbums: TMenuItem;
    miSongs: TMenuItem;
    pmAdd: TPopupMenu;
    miAddArtist: TMenuItem;
    miAddAlbum: TMenuItem;
    miAddSong: TMenuItem;
    pmDelete: TPopupMenu;
    miDelArtist: TMenuItem;
    miDelAlbum: TMenuItem;
    miDelSong: TMenuItem;
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnViewClick(Sender: TObject);
    procedure miArtistsClick(Sender: TObject);
    procedure miAlbumsClick(Sender: TObject);
    procedure miSongsClick(Sender: TObject);
    procedure BtnSortClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure miAddArtistClick(Sender: TObject);
    procedure miAddAlbumClick(Sender: TObject);
    procedure miAddSongClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure miDelArtistClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  DataUnits, ViewForm;
  // Переменные хранения начала каждого списка

procedure TForm1.BtnAddClick(Sender: TObject);
var
  ButtonPt: TPoint;
begin
  // Проверка данных на загрузку.
  if HeadArtists = nil then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  // Отображение выпадающего меню под кнопкой
  ButtonPt := BtnAdd.ClientToScreen(Point(0, BtnAdd.Height));
  pmAdd.Popup(ButtonPt.X, ButtonPt.Y);
end;

procedure TForm1.BtnDeleteClick(Sender: TObject);
var
  ButtonPt: TPoint;
begin
  if HeadArtists = nil then
  begin
    ShowMessage('База данных пуста! Удалять нечего.');
    Exit;
  end;

  // Меню удаления под кнопкой
  ButtonPt := BtnDelete.ClientToScreen(Point(0, BtnDelete.Height));
  pmDelete.Popup(ButtonPt.X, ButtonPt.Y);
end;

procedure TForm1.BtnLoadClick(Sender: TObject);
var
  FileA: FArtists;
  FileAl: FAlbums;
  FileS: FSongs;

  RecA: TArtistFileRecord;
  RecAl: TAlbumFileRecord;
  RecS: TSongFileRecord;

  NewArtist, LastArtist: PArtist;
  NewAlbum, LastAlbum: PAlbum;
  NewSong, LastSong: PSong;
begin
  // Временная генерация файлов данных
  //GenerateTestDataFiles;
  //ShowMessage('Файлы .dat успешно созданы в папке с программой!');

  // Очистка старой памяти перед новой загрузкой
  ClearAllLists;

  try
    // --- ЗАГРУЗКА ИСПОЛНИТЕЛЕЙ ---
    AssignFile(FileA, 'artists.dat');
    Reset(FileA);
    LastArtist := nil;
    while not Eof(FileA) do
    begin
      Read(FileA, RecA);
      New(NewArtist);
      NewArtist^.ArtistCode := RecA.ArtistCode;
      NewArtist^.Name := RecA.Name;
      NewArtist^.Country := RecA.Country;
      NewArtist^.Genre := RecA.Genre;
      NewArtist^.Next := nil;

      if HeadArtists = nil then HeadArtists := NewArtist else LastArtist^.Next := NewArtist;
      LastArtist := NewArtist;
    end;
    CloseFile(FileA);

    // --- ЗАГРУЗКА АЛЬБОМОВ ---
    AssignFile(FileAl, 'albums.dat');
    Reset(FileAl);
    LastAlbum := nil;
    while not Eof(FileAl) do
    begin
      Read(FileAl, RecAl);
      New(NewAlbum);
      NewAlbum^.AlbumCode := RecAl.AlbumCode;
      NewAlbum^.ArtistCode := RecAl.ArtistCode;
      NewAlbum^.Title := RecAl.Title;
      NewAlbum^.Year := RecAl.Year;
      NewAlbum^.Next := nil;

      if HeadAlbums = nil then HeadAlbums := NewAlbum else LastAlbum^.Next := NewAlbum;
      LastAlbum := NewAlbum;
    end;
    CloseFile(FileAl);

    // --- ЗАГРУЗКА ПЕСЕН ---
    AssignFile(FileS, 'songs.dat');
    Reset(FileS);
    LastSong := nil;
    while not Eof(FileS) do
    begin
      Read(FileS, RecS);
      New(NewSong);
      NewSong^.Title := RecS.Title;
      NewSong^.AlbumCode := RecS.AlbumCode;
      NewSong^.Duration := RecS.Duration;
      NewSong^.Next := nil;

      if HeadSongs = nil then HeadSongs := NewSong else LastSong^.Next := NewSong;
      LastSong := NewSong;
    end;
    CloseFile(FileS);

    // Обновление индикатора статуса. Данные загружены
    shpStatus.Brush.Color := clGreen;               // Цвет квадрата статуса зеленый
    lblStatus.Caption := 'Данные успешно загружены в ОЗУ';

  except
    on E: Exception do
    begin
      // В случае ошибки сброс
      ClearAllLists;
      shpStatus.Brush.Color := clRed;
      lblStatus.Caption := 'Ошибка загрузки: ' + E.Message;
    end;
  end;
end;

procedure TForm1.BtnSearchClick(Sender: TObject);
var
  SearchArtistName: string;
  CurrArtist: PArtist;
  CurrAlbum: PAlbum;
  CurrSong: PSong;
  ListItem: TListItem;
  TargetArtistCode: Integer;
  FoundCount: Integer;
  Min, Sec: Integer;
begin
  // Проверка на загрузку данных в память
  if (HeadArtists = nil) or (HeadSongs = nil) or (HeadAlbums = nil) then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  // Запрапрос имени исполнителя
  SearchArtistName := InputBox('Поиск песен по исполнителю', 'Введите имя исполнителя:', '');
  if Trim(SearchArtistName) = '' then Exit;

  // Поиск исполнителя по имени, чтобы узнать его ArtistCode
  TargetArtistCode := -1;
  CurrArtist := HeadArtists;
  while CurrArtist <> nil do
  begin
    if LowerCase(Trim(CurrArtist^.Name)) = LowerCase(Trim(SearchArtistName)) then
    begin
      TargetArtistCode := CurrArtist^.ArtistCode;
      Break; // Выход из цикла при нахождении
    end;
    CurrArtist := CurrArtist^.Next;
  end;

  // Если исполнитель с таким именем не найден
  if TargetArtistCode = -1 then
  begin
    ShowMessage('Исполнитель "' + SearchArtistName + '" не найден в базе.');
    Exit;
  end;

  // Настройка окна fView под вывод найденных песен
  fView.Caption := 'Песни исполнителя: ' + SearchArtistName;
  fView.lvOutput.Items.Clear;
  fView.lvOutput.Columns.Clear;

  with fView.lvOutput.Columns.Add do begin Caption := 'Название песни'; Width := 220; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Альбом'; Width := 150; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Длительность'; Width := 125; end;

  FoundCount := 0;

  // Проход по всем песням в ОЗУ
  CurrSong := HeadSongs;
  while CurrSong <> nil do
  begin
    // Для каждой песни поиск альбома, к которому она принадлежит
    CurrAlbum := HeadAlbums;
    while CurrAlbum <> nil do
    begin
      // Если код альбома у песни совпал с кодом альбома в списке,
      // и этот альбом принадлежит искомому исполнителю
      if (CurrSong^.AlbumCode = CurrAlbum^.AlbumCode) and
         (CurrAlbum^.ArtistCode = TargetArtistCode) then
      begin
        Inc(FoundCount);

        // Добавление строки в таблицу
        ListItem := fView.lvOutput.Items.Add;
        ListItem.Caption := CurrSong^.Title;          // Название песни
        ListItem.SubItems.Add(CurrAlbum^.Title);       // Название альбома

        // Время ММ:СС
        Min := CurrSong^.Duration div 60;
        Sec := CurrSong^.Duration mod 60;
        ListItem.SubItems.Add(Format('%.2d:%.2d (%d сек)', [Min, Sec, CurrSong^.Duration]));

        Break; // Альбом определен, переход к следующей песне
      end;
      CurrAlbum := CurrAlbum^.Next;
    end;

    CurrSong := CurrSong^.Next;
  end;

  // Отображение результата
  if FoundCount > 0 then
    fView.ShowModal
  else
    ShowMessage('У исполнителя "' + SearchArtistName + '" пока нет добавленных песен.');
end;

procedure TForm1.BtnSortClick(Sender: TObject);
begin
  // Проверка на загрузку данных
  if HeadAlbums = nil then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  SortAlbumsByArtistAndYear;

  // Уведомляем пользователя об успешном завершении
  ShowMessage('Альбомы успешно отсортированы внутри исполнителей по годам выпуска!' + sLineBreak +
              'Выберите пункт меню "Просмотр списков" -> "Альбомы" для отображения результата.');
end;

procedure TForm1.BtnViewClick(Sender: TObject);
var
  ButtonPt: TPoint;
begin
  ButtonPt := BtnView.ClientToScreen(Point(0, BtnView.Height));
  pmLists.Popup(ButtonPt.X, ButtonPt.Y);
end;


procedure TForm1.miAddAlbumClick(Sender: TObject);
var
  NewAlb, Curr: PAlbum;
  SAlbumCode, SArtistCode, STitle, SYear: string;
  InAlbCode, InArtCode: Integer;
begin
  SAlbumCode := InputBox('Новый альбом', 'Введите код альбома (число):', '');
  if Trim(SAlbumCode) = '' then Exit;

  InAlbCode := StrToIntDef(SAlbumCode, -1);
  // Проверка уникальности кода альбома
  if IsAlbumCodeExists(InAlbCode) then begin
    ShowMessage('Ошибка! Альбом с кодом ' + SAlbumCode + ' уже существует.');
    Exit;
  end;

  SArtistCode := InputBox('Новый альбом', 'Введите код исполнителя (для связи):', '');
  InArtCode := StrToIntDef(SArtistCode, -1);
  // Проверка на существование исполнителя
  if not IsArtistCodeExists(InArtCode) then begin
    ShowMessage('Ошибка! Исполнителя с кодом ' + SArtistCode + ' не существует. Сначала добавьте исполнителя.');
    Exit;
  end;

  STitle := InputBox('Новый альбом', 'Введите название альбома:', '');
  SYear  := InputBox('Новый альбом', 'Введите год выпуска:', '');

  New(NewAlb);
  NewAlb^.AlbumCode := InAlbCode;
  NewAlb^.ArtistCode := InArtCode;
  NewAlb^.Title := STitle;
  NewAlb^.Year := StrToIntDef(SYear, 0);
  NewAlb^.Next := nil;

  if HeadAlbums = nil then HeadAlbums := NewAlb
  else begin
    Curr := HeadAlbums;
    while Curr^.Next <> nil do Curr := Curr^.Next;
    Curr^.Next := NewAlb;
  end;
  ShowMessage('Альбом успешно добавлен!');
end;

procedure TForm1.miAddArtistClick(Sender: TObject);
var
  NewArt, Curr: PArtist;
  SCode, SName, SCountry, SGenre: string;
  InputCode: Integer;
begin
  // Запрос данных у пользователя
  SCode    := InputBox('Новый исполнитель', 'Введите числом уникальный код исполнителя:', '');
  if Trim(SCode) = '' then Exit;

  InputCode := StrToIntDef(SCode, -1);
  if InputCode <= 0 then begin
    ShowMessage('Ошибка! Код должен быть положительным числом.');
    Exit;
  end;
  // Проверка на уникальность кода
  if IsArtistCodeExists(InputCode) then begin
    ShowMessage('Ошибка! Исполнитель с кодом ' + SCode + ' уже существует в системе.');
    Exit;
  end;

  SName    := InputBox('Новый исполнитель', 'Введите название группы:', '');
  SCountry := InputBox('Новый исполнитель', 'Введите страну:', '');
  SGenre   := InputBox('Новый исполнитель', 'Введите музыкальный жанр:', '');

  // Выделение памяти под новый динамический узел
  New(NewArt);
  NewArt^.ArtistCode := StrToIntDef(SCode, 0);
  NewArt^.Name := SName;
  NewArt^.Country := SCountry;
  NewArt^.Genre := SGenre;
  NewArt^.Next := nil; // Новый элемент указывает в nil

  // Вставка узла в конец списка в ОЗУ
  if HeadArtists = nil then HeadArtists := NewArt
  else
  begin
    Curr := HeadArtists;
    while Curr^.Next <> nil do
      Curr := Curr^.Next; // Поиск последнего элемента списка
    Curr^.Next := NewArt;  // Привязка нового к последнему
  end;

  ShowMessage('Исполнитель успешно добавлен в оперативную память!');
end;

procedure TForm1.miAddSongClick(Sender: TObject);
var
  NewSong, Curr: PSong;
  STitle, SAlbumCode, SDuration: string;
  InAlbCode: Integer;
begin
  STitle := InputBox('Новая песня', 'Введите название песни:', '');
  if Trim(STitle) = '' then Exit;

  // Проверка уникальности названия песни
  if IsSongTitleExists(STitle) then begin
    ShowMessage('Ошибка! Песня с названием "' + STitle + '" уже есть в базе.');
    Exit;
  end;

  SAlbumCode := InputBox('Новая песня', 'Введите код альбома (для связи):', '');
  InAlbCode := StrToIntDef(SAlbumCode, -1);
  // Проверка на существование альбома
  if not IsAlbumCodeExists(InAlbCode) then begin
    ShowMessage('Ошибка! Альбома с кодом ' + SAlbumCode + ' не существует.');
    Exit;
  end;

  SDuration := InputBox('Новая песня', 'Введите длительность в секундах:', '');

  New(NewSong);
  NewSong^.Title := STitle;
  NewSong^.AlbumCode := InAlbCode;
  NewSong^.Duration := StrToIntDef(SDuration, 0);
  NewSong^.Next := nil;

  if HeadSongs = nil then HeadSongs := NewSong
  else begin
    Curr := HeadSongs;
    while Curr^.Next <> nil do Curr := Curr^.Next;
    Curr^.Next := NewSong;
  end;
  ShowMessage('Песня успешно добавлена!');
end;

// ПРОСМОТР АЛЬБОМОВ
procedure TForm1.miAlbumsClick(Sender: TObject);
var
  Curr: PAlbum;
  ListItem: TListItem;
begin
  // Проверка, загружены ли данные
  if HeadAlbums = nil then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  // Форма просмотра под Альбомы
  fView.Caption := 'Просмотр списка: Музыкальные альбомы';
  fView.lvOutput.Items.Clear;
  fView.lvOutput.Columns.Clear;

  // Создание колонок для альбомов
  with fView.lvOutput.Columns.Add do begin Caption := 'Код альбома'; Width := 90; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Код исполнителя'; Width := 110; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Название альбома'; Width := 200; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Год выпуска'; Width := 80; end;

  // Проход по динамическому списку альбомов в ОЗУ
  Curr := HeadAlbums;
  while Curr <> nil do
  begin
    ListItem := fView.lvOutput.Items.Add;
    ListItem.Caption := IntToStr(Curr^.AlbumCode);   // 1 колонка
    ListItem.SubItems.Add(IntToStr(Curr^.ArtistCode)); // 2 колонка
    ListItem.SubItems.Add(Curr^.Title);               // 3 колонка
    ListItem.SubItems.Add(IntToStr(Curr^.Year));       // 4 колонка

    Curr := Curr^.Next; // Переход к следующему элементу
  end;

  // Открытие окна просмотра
  fView.ShowModal;
end;

// ПРОСМОТР ИСПОЛНИТЕЛЕЙ
procedure TForm1.miArtistsClick(Sender: TObject);
var
  Curr: PArtist;
  ListItem: TListItem;
begin
  if HeadArtists = nil then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  // Внешний вид формы просмотра
  fView.Caption := 'Просмотр списка: Музыкальные исполнители';
  fView.lvOutput.Items.Clear;
  fView.lvOutput.Columns.Clear;

  // Колонки
  with fView.lvOutput.Columns.Add do begin Caption := 'Код'; Width := 60; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Имя исполнителя'; Width := 180; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Страна'; Width := 100; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Жанр'; Width := 120; end;

  // Заполнение таблицы данными из динамического списка
  Curr := HeadArtists;
  while Curr <> nil do
  begin
    ListItem := fView.lvOutput.Items.Add;
    ListItem.Caption := IntToStr(Curr^.ArtistCode);
    ListItem.SubItems.Add(Curr^.Name);
    ListItem.SubItems.Add(Curr^.Country);
    ListItem.SubItems.Add(Curr^.Genre);

    Curr := Curr^.Next;
  end;

  // Отображение формы поверх главного меню
  fView.ShowModal;
end;

procedure TForm1.miDelArtistClick(Sender: TObject);
var
  SCode: string;
  InputCode: Integer;

  // Переменные для удаления исполнителя
  CurrArt, PrevArt: PArtist;
  ArtFound: Boolean;

  // Переменные для каскадного удаления альбомов и песен
  CurrAlb, PrevAlb, TempAlb: PAlbum;
  CurrSong, PrevSong, TempSong: PSong;
begin
  SCode := InputBox('Каскадное удаление', 'Введите код исполнителя для ПОЛНОГО удаления:', '');
  if Trim(SCode) = '' then Exit;
  InputCode := StrToIntDef(SCode, -1);

  // Каскадное удаление песен
  // Проверка входит ли песня в альбом, который принадлежит удаляемому исполнителю
  CurrSong := HeadSongs;
  PrevSong := nil;
  while CurrSong <> nil do
  begin
    // Поиск альбома песни в ОЗУ
    CurrAlb := HeadAlbums;
    while CurrAlb <> nil do
    begin
      if (CurrSong^.AlbumCode = CurrAlb^.AlbumCode) and (CurrAlb^.ArtistCode = InputCode) then
        Break; // Альбом найден и он принадлежит удаляемому исполнителю
      CurrAlb := CurrAlb^.Next;
    end;

    // Если альбом принадлежит удаляемому автору - удаляется песня из памяти
    if CurrAlb <> nil then
    begin
      TempSong := CurrSong;
      if PrevSong = nil then
        HeadSongs := CurrSong^.Next
      else
        PrevSong^.Next := CurrSong^.Next;

      CurrSong := CurrSong^.Next;
      Dispose(TempSong); // Удаление песни
    end
    else
    begin
      // Переход на следующую при несовпадении
      PrevSong := CurrSong;
      CurrSong := CurrSong^.Next;
    end;
  end;

  // Каскадное удаление альбомов
  CurrAlb := HeadAlbums;
  PrevAlb := nil;
  while CurrAlb <> nil do
  begin
    if CurrAlb^.ArtistCode = InputCode then
    begin
      TempAlb := CurrAlb;
      if PrevAlb = nil then
        HeadAlbums := CurrAlb^.Next
      else
        PrevAlb^.Next := CurrAlb^.Next;

      CurrAlb := CurrAlb^.Next;
      Dispose(TempAlb); // Удаление альбома
    end
    else
    begin
      PrevAlb := CurrAlb;
      CurrAlb := CurrAlb^.Next;
    end;
  end;

  // Удаление исполнителя
  CurrArt := HeadArtists;
  PrevArt := nil;
  ArtFound := False;

  while CurrArt <> nil do
  begin
    if CurrArt^.ArtistCode = InputCode then
    begin
      ArtFound := True;
      if PrevArt = nil then
        HeadArtists := CurrArt^.Next
      else
        PrevArt^.Next := CurrArt^.Next;

      Dispose(CurrArt); // Удаление исполнителя из памяти
      Break;
    end;
    PrevArt := CurrArt;
    CurrArt := CurrArt^.Next;
  end;

  // Отображение итога операции
  if ArtFound then
    ShowMessage('Исполнитель с кодом ' + SCode + ' и все связанные с ним альбомы и песни были успешно удалены из ОЗУ!')
  else
    ShowMessage('Исполнитель с таким кодом не найден.');
end;

// ПРОСМОТР ПЕСЕН
procedure TForm1.miSongsClick(Sender: TObject);
var
  Curr: PSong;
  ListItem: TListItem;
  Min, Sec: Integer;
begin
  // Проверка на загрузку данных
  if HeadSongs = nil then
  begin
    ShowMessage('В оперативной памяти нет данных! Сначала выполните загрузку.');
    Exit;
  end;

  // Настройка формы просмотра под Песни
  fView.Caption := 'Просмотр списка: Песни в альбомах';
  fView.lvOutput.Items.Clear;
  fView.lvOutput.Columns.Clear;

  // Создание колонок для песен
  with fView.lvOutput.Columns.Add do begin Caption := 'Название песни'; Width := 220; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Код альбома'; Width := 90; end;
  with fView.lvOutput.Columns.Add do begin Caption := 'Длительность'; Width := 100; end;

  // Проход по динамическому списку песен в ОЗУ
  Curr := HeadSongs;
  while Curr <> nil do
  begin
    ListItem := fView.lvOutput.Items.Add;
    ListItem.Caption := Curr^.Title;               // 1 колонка
    ListItem.SubItems.Add(IntToStr(Curr^.AlbumCode)); // 2 колонка

    // Перевод секунд в ММ:СС
    Min := Curr^.Duration div 60;
    Sec := Curr^.Duration mod 60;
    ListItem.SubItems.Add(Format('%.2d:%.2d (%d сек)', [Min, Sec, Curr^.Duration])); // 3 колонка

    Curr := Curr^.Next; // Переход к следующему элементу
  end;

  // Открытие окна просмотра
  fView.ShowModal;
end;

end.
