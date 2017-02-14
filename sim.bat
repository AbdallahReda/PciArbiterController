del /f testing.dump
del / f compiled_file
iverilog -o compiled_file arbiter.v SimpleInitiator.v SpecializedMux.v arbiterTB.v
vvp compiled_file

