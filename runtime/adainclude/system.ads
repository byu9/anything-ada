package System with
   Pure,
   No_Elaboration_Code_All
is
   type Name is (DEFAULT_SYSTEM);
   System_Name : constant Name := DEFAULT_SYSTEM;

   Min_Int : constant := -2**(Standard'Max_Integer_Size - 1);
   Max_Int : constant := 2**(Standard'Max_Integer_Size - 1) - 1;

   Max_Binary_Modulus    : constant := 2**Standard'Max_Integer_Size;
   Max_Nonbinary_Modulus : constant := 2**Integer'Size - 1;

   Max_Base_Digits : constant := Long_Long_Float'Digits;
   Max_Digits      : constant := Long_Long_Float'Digits;

   Max_Mantissa : constant := Standard'Max_Integer_Size - 1;
   Fine_Delta   : constant := 2.0**(-Max_Mantissa);

   Tick : constant := 0.0;

   type Address is private with
      Preelaborable_Initialization;

   Null_Address : constant Address;

   function "<" (Left, Right : Address) return Boolean with
      Import,
      Convention => Intrinsic;

   function "<=" (Left, Right : Address) return Boolean with
      Import,
      Convention => Intrinsic;

   function ">" (Left, Right : Address) return Boolean with
      Import,
      Convention => Intrinsic;

   function ">=" (Left, Right : Address) return Boolean with
      Import,
      Convention => Intrinsic;

   function "=" (Left, Right : Address) return Boolean with
      Import,
      Convention => Intrinsic;

   Storage_Unit : constant := 8;
   Word_Size    : constant := Standard'Word_Size;
   Memory_Size  : constant := 2**Word_Size;

   type Bit_Order is (High_Order_First, Low_Order_First);
   Default_Bit_Order : constant Bit_Order :=
     Bit_Order'Val (Standard'Default_Bit_Order);

   subtype Any_Priority is Integer range 0 .. 31;
   subtype Priority is Any_Priority range 0 .. 30;
   subtype Interrupt_Priority is Any_Priority range 31 .. 31;

   Default_Priority : constant Priority := 15;

private
   Run_Time_Name : constant String := "ARM Baremetal Runtime";

   ----------------------------------------------------------------------------
   --  These options are used internally by GNAT to control compiler behavior.
   --  See targparm.ads in GNAT compiler source code.
   ----------------------------------------------------------------------------
   Configurable_Run_Time     : constant Boolean := True;
   Suppress_Standard_Library : constant Boolean := False;

   Command_Line_Args         : constant Boolean := False;
   Exit_Status_Supported     : constant Boolean := False;
   Use_Ada_Main_Program_Name : constant Boolean := False;

   Backend_Divide_Checks   : constant Boolean := False;
   Backend_Overflow_Checks : constant Boolean := True;

   Denorm            : constant Boolean := True;
   Machine_Rounds    : constant Boolean := True;
   Machine_Overflows : constant Boolean := False;
   Signed_Zeros      : constant Boolean := True;

   ZCX_By_Default      : constant Boolean := False;
   Frontend_Exceptions : constant Boolean := True;

   Preallocated_Stacks       : constant Boolean := False;
   Duration_32_Bits          : constant Boolean := False;
   Atomic_Sync_Default       : constant Boolean := True;
   Support_Aggregates        : constant Boolean := True;
   Support_Atomic_Primitives : constant Boolean := False;
   Support_Composite_Assign  : constant Boolean := True;
   Support_Composite_Compare : constant Boolean := True;
   Support_Long_Shifts       : constant Boolean := False;
   Support_Nondefault_SSO    : constant Boolean := True;

   Always_Compatible_Rep : constant Boolean := True;
   Stack_Check_Probes    : constant Boolean := False;
   Stack_Check_Limits    : constant Boolean := False;
   Stack_Check_Default   : constant Boolean := False;

   type Address is mod Memory_Size;
   Null_Address : constant Address := 0;

end System;
