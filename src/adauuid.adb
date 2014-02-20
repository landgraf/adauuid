with adauuid_internals; use adauuid_internals;
with Interfaces.C.Strings;
package body adauuid is

   function Bin (U : in out UUID) return UUID_Bin is (U.Bin);

   procedure Clear (U : in out UUID) is
   begin
      uuid_clear (U.Bin);
   end Clear;

   procedure Copy (Src : in UUID; Dst : out UUID) is
   begin
      uuid_copy (Src => Src.Bin, Dst => Dst.Bin);
   end Copy;

   function From_String (Str : in String) return UUID is
      U : UUID;
      C_String : Interfaces.C.Strings.chars_ptr :=
        Interfaces.C.Strings.New_String (Str);
   begin
      Clear (U);
      if Integer (uuid_parse (C_String, U.Bin)) /= 0 then
         Interfaces.C.Strings.Free (C_String);
         raise Constraint_Error with "unparse " & Str  & " failed";
      end if;
      Interfaces.C.Strings.Free (C_String);
      return U;
   end From_String;

   function Generate return UUID_Bin is
      U : UUID_Bin;
   begin
      uuid_generate_random (U);
      return U;
   end Generate;

   function "=" (U1 : in UUID; U2 : in UUID) return Boolean is
       (Integer (uuid_compare (U1.Bin, U2.Bin)) = 0);

   function Is_Null (Self : in UUID) return Boolean is
       (Integer (uuid_is_null (Self.Bin)) /= 0);

   function To_String (U : in out UUID) return String is
      Str : String (1 .. 36) := (others => '0');
   begin
      uuid_unparse_upper (U.Bin, Str);
      return Str;
   end To_String;

end adauuid;
