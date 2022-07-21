import $;
import ML_Core;
mytraindata := $.prep01.mytraindata;

ml_core.appendSeqId(mytraindata,recid,mytrainIDdata);

ml_core.tofield(mytrainIDdata,mytrainIDdataNF);

export convert02 := module
  export myaggs := ml_core.fieldaggregates(mytrainIDdataNF).simple;
  
  fstd(real fieldval, unsigned varnum):= (fieldval-myaggs(number=varnum)[1].mean)/myaggs(number=varnum)[1].sd;
  
  recordof(mytrainIDdata) ml_std(mytrainIDdata Le) := transform
    self.ano_mes_ref          := fstd(Le.ano_mes_ref,1);
    self.ano_mes_comp         := fstd(Le.ano_mes_comp,2);
    self.codigo_SIAFI         := fstd(Le.codigo_SIAFI,3);
    self.cpf_beneficiario     :=fstd(Le.cpf_beneficiario,4);
    self.nis_beneficiario     :=fstd(Le.nis_beneficiario,5);
    self.data_saque           :=fstd(Le.data_saque,6);
    self.valor_parcela        :=fstd(Le.valor_parcela,7);
    self                      :=Le;
  end;
  
  export mytraindataSTD := project(mytrainIDdata,ml_std(left));
  
  ml_core.tofield(mytraindatastd,mytraindataSTDNF);
  
  export mytrainattrNF := mytraindataSTDNF(number<8);
 end; 
    
    