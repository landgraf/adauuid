with Interfaces.C; 
package adauuid is 
    subtype UUID is String(1..36); 
    Null_UUID : constant UUID := (others => '-');
    type Letter_Case is (None, Upper, Lower); 

    type UUID_Bin is limited private;
    function Generate return UUID_Bin; 
    function Parse(U : in UUID_Bin; Translate : in Letter_Case := Upper) return UUID; 
    procedure Clear(U : in out UUID_Bin); 

    function "="(U1 : in UUID_Bin; U2 : in UUID_Bin) return Boolean;

    procedure Copy(Src : in UUID_Bin; Dst : out UUID_Bin);
    
    private
    type UUID_Bin is array (1..16) of Interfaces.C.unsigned_char; 
end adauuid; 

