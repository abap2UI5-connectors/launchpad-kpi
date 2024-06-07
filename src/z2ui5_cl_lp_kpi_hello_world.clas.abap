CLASS z2ui5_cl_lp_kpi_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES z2ui5_if_lp_kpi.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z2ui5_cl_lp_kpi_hello_world IMPLEMENTATION.

  METHOD z2ui5_if_lp_kpi~count.
    TRY.
        DATA lr_val TYPE REF TO data.
        /ui2/cl_json=>deserialize(
          EXPORTING
            json             = filter                 " JSON string
          CHANGING
            data             = lr_val                 " Data to serialize
        ).

        ASSIGN ('LR_VAL->PROP1->*') TO FIELD-SYMBOL(<prop1>).
        IF sy-subrc <> 0.
          RETURN.
        ENDIF.

        CASE <prop1>.
          WHEN `A`.
            result = 10.
          WHEN `B`.
            result = 20.
        ENDCASE.

      CATCH cx_root.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
