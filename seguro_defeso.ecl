EXPORT seguro_defeso := MODULE
  export Layout := RECORD

    real MES_REFERENCIA;
    STRING UF;
    string CODIGO_MUNICIPIO_SIAFI;
    STRING NOME_MUNICIPIO;
    STRING CPF_FAVORECIDO;
    real NIS_FAVORECIDO;
    STRING RGP_FAVORECIDO;
    STRING NOME_FAVORECIDO;
    string VALOR_PARCELA;
END;

 EXPORT File := DATASET('~ bmf::seguro_defeso.csv',Layout,csv(HEADING(1)));
 
 export MLseguro_defeso := record
    real MES_REFERENCIA;
    real CODIGO_MUNICIPIO_SIAFI;
    real NIS_FAVORECIDO;
    real VALOR_PARCELA;
  end;
  

END; 