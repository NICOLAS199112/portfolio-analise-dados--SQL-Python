# -*- coding: utf-8 -*-
"""Untitled14.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1FMh4K8RaaD5FDt6eLSrb_u7MhweRniGf

Exercicio 1

Problema: Suponha que você receba o nome de uma cidade no formato "Cidade - UF", crie uma função para retornar o nome da cidade em uma tupla com primeiro elemento sendo o estado e o segundo elemento sendo a cidade
"""

def cidade_uf (cidade):
  estado = cidade.split()[2]
  cidade = cidade.split()[0]
  resultado = (estado, cidade)
  return (estado,cidade)

cidade = 'jardinamerica - MS'
cidade_uf(cidade)

cidade = 'florianópolis - SC'
cidade_uf(cidade)

"""Exercicio 2
Crie uma função para calcular o rendimento de um investimento a juros compostos após um determinado período de meses.

Retorno=InvestimentoInicial∗(1+TaxaJuros)mesesaplicacao
"""

investimento = 10000
taxa_juros = 0.05
meses_aplicacao = 6
retorno = investimento * (1 + taxa_juros) ** meses_aplicacao
print(retorno)

def retor_inves(investimento, taxa_juros, meses_aplicacao):
  """
    permite o calculo do retorno de um investimento
    parametros: taxa de juros, investimento inicial e meses de aplicacao
    retorno: rendimento
  """
  retorno = investimento * (1 + taxa_juros) ** meses_aplicacao

  return retorno

retorno = retor_inves(10000, 0.05, 6)
print(retorno)