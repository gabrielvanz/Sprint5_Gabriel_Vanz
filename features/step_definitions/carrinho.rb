Quando('aumentar a quantidade do produto no carrinho') do
    sleep 1.5
    @cart_page = Pages::Cart.new
    @cart_page.load
    sleep 0.5
    @cart_page.increase_product.click
    sleep 1.5
end

Então('deverá alterar a quantidade exibida no carrinho para {string}') do |string|
    expect(@cart_page.cart_quantity_products_cartPage.value).to eql "2"
end

Quando('diminuir a quantidade do produto no carrinho') do
    sleep 1.5
    @cart_page = Pages::Cart.new
    @cart_page.load
    sleep 1
    @cart_page.decrease_product.click
    sleep 1.5
end

Então('deverá remover o produto do carrinho') do
    expect(@cart_page).not_to have_cart_item
end

Quando('clicar na lixeira de um produto existente no carrinho') do
    sleep 1.5
    @cart_page = Pages::Cart.new
    @cart_page.load
    sleep 1
    @cart_page.cart_remove_product_cartPage.click
end

Então('deverá remover o produto do carrinho na página do carrinho') do
    expect(@cart_page).not_to have_cart_item
end

Quando('clicar na lixeira de um produto existente no carrinho no modal do carrinho') do
    sleep 1.5
    @cart_page = Pages::Cart.new
    @cart_page.exit_modal_page.click
    @cart_page.modal_cart.hover
    @cart_page.cart_remove_product_modal.click
end

Então('deverá remover o produto do modal do carrinho') do
    expect(@cart_page).not_to have_cart_item_modal
end