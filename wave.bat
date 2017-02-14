del /f testing.dump
del / f compiled_file
iverilog -o compiled_file add.v and.v or.v not.v
vvp compiled_file
gtkwave testing.dump


