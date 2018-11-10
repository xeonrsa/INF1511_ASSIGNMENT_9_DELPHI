unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TformAssignment9Arrays = class(TForm)
    lbArray: TListBox;
    gpListboxOption: TGroupBox;
    gpStringArray: TGroupBox;
    gpIntArray: TGroupBox;
    btnClear: TButton;
    btnDelete: TButton;
    btnStrInit: TButton;
    btnStrAssign: TButton;
    btnStrCap: TButton;
    btnStrDisplay: TButton;
    btnIntInit: TButton;
    btnIntAssign: TButton;
    btnIntDoub: TButton;
    btnIntDisplay: TButton;
    memoMessage: TMemo;
    imgSport: TImage;
    dtpDate: TDateTimePicker;
    dtpTime: TDateTimePicker;
    btnCombine: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStrInitClick(Sender: TObject);
    procedure btnStrDisplayClick(Sender: TObject);
    procedure btnStrAssignClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Function IsStrArrayEmpty : Boolean;

var
  formAssignment9Arrays: TformAssignment9Arrays;

  Const
    nItems = 5;
  Var
    nBasicsIntArray : array [0..(nItems-1)] of integer;
    nBasicsStrArray : array [0..(nItems-1)] of string;



implementation

{$R *.dfm}

procedure TformAssignment9Arrays.FormCreate(Sender: TObject);
begin
  formAssignment9Arrays.dtpDate.Date := Date();
  formAssignment9Arrays.dtpTime.Time := Time();
end;

procedure TformAssignment9Arrays.btnStrInitClick(Sender: TObject);
// Declare Required Vars
Var
  i : Integer;
begin
// Run a loop for all arrays items and set init values to 0 as stated in Tutorial - I would rather set values to '' to prevent confusion 
  For i := 0 to (nItems-1) Do Begin
    nBasicsStrArray[i] := '0';
  End;
end;

procedure TformAssignment9Arrays.btnStrDisplayClick(Sender: TObject);
// Declare Required Vars
Var
  i : Integer;
  validCount : Integer;
begin
  // Check if values in String Array
  If (IsStrArrayEmpty) Then Begin
    // If not values found warn user and exit code
    MessageDlg('String Array Can''t Display Becuase String Array is Empty, Please Assign Some Values!',mtWarning,[mbOK],0);
    Exit;
  End;
  // Set Defualts
  validCount := 0;
  // Add Header to Indicate Array type
  formAssignment9Arrays.lbArray.Items.Add('**** String Array ****');
  // Add Date & Time
  formAssignment9Arrays.lbArray.Items.Add(DateTimeToStr(now));
  // Use For loop to loop trough each item of array
  For i := 0 to (nItems-1) Do Begin
    // Ensure no blank items are added to display
    if (nBasicsStrArray[i] <> '') Then Begin
      inc(validCount,1);
      formAssignment9Arrays.lbArray.Items.Add(IntToStr(validCount) +') ' + nBasicsStrArray[i]);
    End;
  End;
  // Add footer to show end of array
  formAssignment9Arrays.lbArray.Items.Add('********');
  // Added Blank so seperate from rest of items to follow
  formAssignment9Arrays.lbArray.Items.Add('');  
end;

procedure TformAssignment9Arrays.btnStrAssignClick(Sender: TObject);
Var
  i : Integer;
begin
  for i := 0 to (nItems-1) Do Begin
    nBasicsStrArray[i] := InputBox('','','');
  End;
end;

{*************** IsStrArrayEmpty ***************}

Function IsStrArrayEmpty : Boolean;
// Declare Required Vars
Var
  i : Integer;
Begin
  // Set Defualts
  Result := True;
  // Loop trough array if any item found then not empty
  For i := 0 to (nItems-1) Do Begin
    If (nBasicsStrArray[i] <> '') Then Begin
      // Set Return flag
      Result := False;
      // Exit loop
      Break;
    End;
  End;
End;

end.
