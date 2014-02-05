with adauuid_internals; use adauuid_internals;
package body adauuid is 

    function Generate return UUID_Bin is
        U : UUID_Bin; 
    begin
        uuid_generate_random(U); 
        return U;
    end Generate;
            
    function Parse(U : in UUID_Bin; Translate : in Letter_Case := Upper) return UUID is
        Retval : UUID := Null_UUID; 
    begin
        case Translate is
            when Upper =>
                uuid_unparse_upper(U, Retval); 
            when Lower =>
                uuid_unparse_lower(U, Retval); 
            when others =>
                uuid_unparse(U, Retval); 
        end case;

        return retval;
    end Parse;

    procedure Clear(U : in out UUID_Bin) is 
    begin
        uuid_clear(U);
    end Clear;

    function "="(U1 : in UUID_Bin; U2 : in UUID_Bin) return Boolean is (Integer(uuid_compare(U1, U2)) = 0);

    procedure Copy(Src : in UUID_Bin; Dst : out UUID_Bin) is
    begin
        uuid_copy(Src => Src, Dst => Dst);
    end Copy;
end adauuid; 

