EXPORT bolsa_familia_saques := MODULE
  EXPORT Layout := RECORD

    STRING ano_mes_ref;
    STRING ano_mes_comp;
    STRING uf;
    STRING codigo_SIAFI;
    STRING municipio;
    STRING cpf_beneficiario;
    STRING nis_beneficiario;
    STRING nome_beneficiario;
    STRING data_saque;
    STRING valor_parcela;
END;

 EXPORT File := DATASET('~bmf::bolsa_familia_saques_2018.csv',Layout,csv);
 
 export MLbolsa_familia_saques := record
    real ano_mes_ref;
    real ano_mes_comp;
    real codigo_SIAFI;
    real cpf_beneficiario;
    real nis_beneficiario;
    real data_saque;
    real valor_parcela;
  end;
  



END; 

