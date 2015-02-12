$ ->
  $('.pdf_link').click ->
    variance = parseFloat $(this).data 'variance'
    if variance >= 1.25
      alert "Variance is at or above 1.25"
      false
    else
      true
