with Aunit.Reporter.Text; 
with Aunit.Run; 
with adauuid_suite; 
procedure adauuid_harness is 

    procedure Runner is new Aunit.Run.Test_Runner (Adauuid_Suite); 

    Reporter : Aunit.Reporter.Text.Text_Reporter; 
begin
    Aunit.Reporter.Text.Set_Use_ANSI_Colors(Reporter, True);
    Runner(Reporter); 
end adauuid_harness; 

