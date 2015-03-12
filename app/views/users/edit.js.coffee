form = $("<%=j render "form" %>")
form_id = form.attr 'id'

src = $('#'+form_id)

form.css 'visability', false
src.after form
delta = '+=' + ( form.height() - src.height() )
form.detach()
form.css 'visability', true

src.animate {
  height: delta
  opacity: 0.5
}, 200, ->
  src.html form.html()
  src.animate { opacity: 1 }, 200
  return



<% if true %>
  alert('<%= @redirect %>')
  # document.location.href = '<%=  @redirect %>';
<% else %>

alert(0);

<% end %>
