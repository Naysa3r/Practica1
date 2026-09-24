unit DataUnits;

interface

uses
  System.SysUtils;

type

// --- »—ѕќЋЌ»“≈Ћ» ---
  PArtist = ^TArtist; // ”казатель на запись исполнител€
  TArtist = record
    ArtistCode: Integer;
    Name: string[100];
    Country: string[50];
    Genre: string[30];
    Next: PArtist; // —сылка на следующего исполнител€ в списке
  end;

  // --- јЋ№Ѕќћџ ---
  PAlbum = ^TAlbum; // ”казатель на запись альбома
  TAlbum = record
    AlbumCode: Integer;
    ArtistCode: Integer; // —в€зь с исполнителем
    Title: string[100];
    Year: Integer;
    Next: PAlbum; // —сылка на следующий альбом
  end;

  // --- ѕ≈—Ќ» ---
  PSong = ^TSong; // ”казатель на запись песни
  TSong = record
    Title: string[100];
    AlbumCode: Integer; // —в€зь с альбомом
    Duration: Integer; // ƒлительность в секундах
    Next: PSong; // —сылка на следующую песню
  end;


  // “ипы дл€ работы с типизированными файлами на диске
  TArtistFileRecord = record
    ArtistCode: Integer;
    Name: string[100];
    Country: string[50];
    Genre: string[30];
  end;

  TAlbumFileRecord = record
    AlbumCode: Integer;
    ArtistCode: Integer;
    Title: string[100];
    Year: Integer;
  end;

  TSongFileRecord = record
    Title: string[100];
    AlbumCode: Integer;
    Duration: Integer;
  end;

  // “ипы типизированных файлов
  FArtists = file of TArtistFileRecord;
  FAlbums  = file of TAlbumFileRecord;
  FSongs   = file of TSongFileRecord;


implementation

end.
