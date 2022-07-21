import $,std;

bolsa_familia_saques    := $.bolsa_familia_saques.File;
ML_bolsa_familia_saques := $.bolsa_familia_saques.MLbolsa_familia_saques;

export prep01 := module
  export MLbolsa_familia_saquesext := record(ML_bolsa_familia_saques)
    unsigned4 rnd;
  end;
  
  MLbolsa_familia_saquesext ml_clean (bolsa_familia_saques Le) := transform
    self.rnd                        :=random();
    self.ano_mes_ref                := (real) Le.ano_mes_ref;
    self.ano_mes_comp               := (real) Le.ano_mes_comp;
    self.codigo_SIAFI               := (real) Le.codigo_SIAFI;
    self.cpf_beneficiario           := (real) Le.cpf_beneficiario;
    self.nis_beneficiario           := (real) Le.nis_beneficiario;
    self.data_saque                 := (real) Le.data_saque;
    self.valor_parcela               := (real) Le.valor_parcela;
  end;
  
  export mydataE := project(bolsa_familia_saques,ml_clean(left));
  
  shared mydataes := sort(mydatae, rnd);
  
  export mytraindata := project(mydataes[1..5000], ml_bolsa_familia_saques);
 end; 

    
   