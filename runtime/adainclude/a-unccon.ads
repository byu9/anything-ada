generic
   type Source (<>) is limited private;
   type Target (<>) is limited private;

function Ada.Unchecked_Conversion (S : Source) return Target with
   Pure,
   No_Elaboration_Code_All,
   Import,
   Convention => Intrinsic;
