
function xeng_top_sp_config(this_block)

  % Revision History:
  %
  %   27-Jan-2014  (18:16 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/jack/github/jack-h/mlib_devel/hdl_lib/xeng_lib/xeng_sp_top.v
  %
  %

  this_block.setTopLevelLanguage('Verilog');

  this_block.setEntityName('xeng_top_sp');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('sync_in');
  this_block.addSimulinkInport('din');
  this_block.addSimulinkInport('vld');
  this_block.addSimulinkInport('mcnt');

  this_block.addSimulinkOutport('dout');
  this_block.addSimulinkOutport('dout_uncorr');
  this_block.addSimulinkOutport('sync_out');
  this_block.addSimulinkOutport('vld_out');
  this_block.addSimulinkOutport('window_vld_out');
  this_block.addSimulinkOutport('mcnt_out');
  this_block.addSimulinkOutport('last_triangle');
  this_block.addSimulinkOutport('buf_sel_out');

  sync_out_port = this_block.port('sync_out');
  sync_out_port.setType('UFix_1_0');
  sync_out_port.useHDLVector(false);
  vld_out_port = this_block.port('vld_out');
  vld_out_port.setType('UFix_1_0');
  vld_out_port.useHDLVector(false);
  window_vld_out_port = this_block.port('window_vld_out');
  window_vld_out_port.setType('UFix_1_0');
  window_vld_out_port.useHDLVector(false);
  last_triangle_port = this_block.port('last_triangle');
  last_triangle_port.setType('UFix_1_0');
  last_triangle_port.useHDLVector(false);
  buf_sel_out_port = this_block.port('buf_sel_out');
  buf_sel_out_port.setType('UFix_1_0');
  buf_sel_out_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('sync_in').width ~= 1);
      this_block.setError('Input data type for port "sync_in" must have width=1.');
    end

    this_block.port('sync_in').useHDLVector(false);

    % (!) Port 'din' appeared to have dynamic type in the HDL -- please add type checking as appropriate;

    if (this_block.port('vld').width ~= 1);
      this_block.setError('Input data type for port "vld" must have width=1.');
    end

    this_block.port('vld').useHDLVector(false);

    % (!) Port 'mcnt' appeared to have dynamic type in the HDL -- please add type checking as appropriate;

  % (!) Port 'dout' appeared to have dynamic type in the HDL
  % --- you must add an appropriate type setting for this port
  % (!) Port 'dout_uncorr' appeared to have dynamic type in the HDL
  % --- you must add an appropriate type setting for this port
  % (!) Port 'mcnt_out' appeared to have dynamic type in the HDL
  % --- you must add an appropriate type setting for this port
  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk','ce')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);

  % (!) Custimize the following generic settings as appropriate. If any settings depend
  %      on input types, make the settings in the "inputTypesKnown" code block.
  %      The addGeneric function takes  3 parameters, generic name, type and constant value.
  %      Supported types are boolean, real, integer and string.
  this_block.addGeneric('SERIAL_ACC_LEN_BITS','integer','7');
  this_block.addGeneric('P_FACTOR_BITS','integer','2');
  this_block.addGeneric('BITWIDTH','integer','4');
  this_block.addGeneric('ACC_MUX_LATENCY','integer','2');
  this_block.addGeneric('FIRST_DSP_REGISTERS','integer','2');
  this_block.addGeneric('DSP_REGISTERS','integer','2');
  this_block.addGeneric('N_ANTS','integer','64');
  this_block.addGeneric('BRAM_LATENCY','integer','2');
  this_block.addGeneric('MCNT_WIDTH','integer','48');

  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('/home/jack/github/jack-h/mlib_devel/hdl_lib/xeng_lib/xeng_sp_top.v');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------

