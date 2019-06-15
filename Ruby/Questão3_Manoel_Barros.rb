
class Contato
  def initialize(name, telephone)
    @name = name
    @telephone = telephone
  end

  def showName
    @name
  end

  def showTelephone
    @telephone
  end

  def modifyName(name)
    @name = name
  end
end

class Agenda
  def initialize
    @lista = []
  end
  def adicionar(contato)
      @lista << contato
  end

  def remover(name)
  removido = false
    @lista.each do |contato|
      if contato.showName == name
        @lista.delete(contato)
        removido = true
      end
    end
    return removido
  end

  def buscar_por_nome(name)
  found_name = false
    @lista.each do |contato|
      if contato.showName == name
        return contato
        found_name = true
      end
    end
    return found_name
  end

  def busca_por_telefone(telephone)
    found_tel = false
    @lista.each do |contato|
      if contato.showTelephone == telephone
        return contato
        found_tel = true
      end
    end
    return found_tel
  end

end