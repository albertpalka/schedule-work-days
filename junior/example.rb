module Example
  def self.percent(total, value)
    total.to_f / value.to_f * 100.0
    # Napisz metodę która dla dowolnych dwóch liczb zwróci procentową wartość jeden z liczb względem drugiej
  end

  def self.reverse_long_words(string)
    string.split.map { |str| str.length >= 5 ? str.reverse : str }.join(' ')
    # Uzupełnij metodę reverse_long_words(string).
    # Metoda ta odwraca każdy wyraz o znakach 5 lub więcej i zwraca całość do użytkownika.
    # Na przykład
    # INPUT : "Ala ma kotozaura wiec jest okejson"
    # OUTPUT : "Ala ma aruazotok wiec jest nosjeko"
  end

  def split_number(number)
    # Uzupełnij metodę split_number(number). Metoda ta ma podzielić liczbę na jedności, dziesiątki, setki itd... i wyświetlić je w postaci dodawania. # NP 12 => 10 + 2 ; 125 => 100 + 20 + 5. 1056 => 1000 + 50 + 6. # Uwaga. Należy zwrócić uwagę by nie wyświetlać w dodawaniu + 0, gdy jedna z części jest równa zeru.

    # KOMENTARZ: Niestety nie wiem, jak to zaimplementować poprawnie.
  end

  def alphabet_position(text)
    str = text.gsub(/\s/, '')
    if str.scan(/\W/).count > 0
      ''
    else
      positions = []
      str.each_char { |c| positions << c.downcase.ord - 96 }
      positions.join(' ')
    end
    # Napisz metode która dla podanego tekstu zwróci pozycje kazdej litery w alfabecie
    # Jeśli coś nie jest literą zignoruj to i pomiń
    # Przykład
    # alphabet_position("To jest test metody")
    # "20 15 10 5 19 20 20 5 19 20 13 5 20 15 4 25"
    # alphabet_position("123--")
    # ""
  end
end
