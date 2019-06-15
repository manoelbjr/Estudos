def diaValido (dia, mes,ano)
  valido = false
  if dia>= 1 && dia<=31
    if mes >= 1 && mes<=12
      if ano>0
        valido = true
      end
    end
  end
  return valido
end