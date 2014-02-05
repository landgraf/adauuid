with adauuid_internals; use adauuid_internals;
package body adauuid is 

    function To_String(U : in out UUID) return UUID_String is (U.Str);

    function Generate return UUID_Bin is
        U : UUID_Bin; 
    begin
        uuid_generate_random(U); 
        return U;
    end Generate;
            
    procedure Parse(U : in out UUID; Translate : in Letter_Case := Upper) is
    begin
        case Translate is
            when Upper =>
                uuid_unparse_upper(U.Bin, U.Str); 
            when Lower =>
                uuid_unparse_lower(U.Bin, U.Str); 
            when others =>
                uuid_unparse(U.Bin, U.Str); 
        end case;
    end Parse;

    procedure Clear(U : in out UUID) is 
    begin
        uuid_clear(U.Bin);
    end Clear;

    function "="(U1 : in UUID; U2 : in UUID) return Boolean is (Integer(uuid_compare(U1.Bin, U2.Bin)) = 0);

    procedure Copy(Src : in UUID; Dst : out UUID) is
    begin
        uuid_copy(Src => Src.Bin, Dst => Dst.Bin);
        uuid_unparse(Dst.Bin, Dst.Str);
    end Copy;
end adauuid; 

