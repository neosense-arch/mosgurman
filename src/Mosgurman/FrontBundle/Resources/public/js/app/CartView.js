/**
 * Created by Yury Smidovich (Stmol)
 * Date: 26.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */
'use strict';

var MGApp = MGApp || {};

MGApp.CartView = Backbone.View.extend({

  events: {
    'click .delete > a': 'onDeleteClick',
    'change select':     'onChangeSelect'
  },

  initialize: function () {
    this._costs = [];

    this.listenTo(this.collection, 'remove', this.removeProduct);
    this.listenTo(this.collection, 'add', this.addProduct);

    var self = this;

    this.$el.find('.basket-block').each(function (idx, el) {
      self.calculateOrderPrice($(el));
    });
    this.redrawButton();
  },

  onDeleteClick: function (e) {
    e.preventDefault();

    var $target = $(e.target);
    var orderID = $target
      .parent('div')
      .parent('.basket-block').data('order-id');

    var model = this.collection.get(orderID);

    this.collection.remove(model);
  },

  removeProduct: function (product) {
    var self = this;

    product.destroy({
      success: function (model, response, options) {
        var code = options.xhr.status;
        self.removeBasketBlock(model.id);
      },
      error: function (model, response, options) {
        var code = options.xhr.status;

        switch (code) {
          case 400:
            location.reload();
            break;

          case 403:
            location.reload();
            break;

          case 404:
            self.removeBasketBlock(model.id);
            break;

          default:
            self.collection.add(model);
            break;
        }
      }
    });

    this.redrawButton();
  },

  addProduct: function () {
    this.redrawProductCount();
    this.redrawButton();
  },

  removeBasketBlock: function (id) {
    var $block = this.$('div[data-order-id="' + id + '"]');

    this._costs[id] = 0;
    $block.remove();

    this.redrawProductCount();
    this.calculateSummaryPrice();
  },

  redrawProductCount: function () {
    $('.cart > .number > a').text(this.collection.length);
  },

  calculateOrderPrice: function ($basketBlock) {
    var price = $basketBlock.children('.weight').children('select').find(':selected').data('price');
    var count = $basketBlock.find('#count-selector').val();
    var cost = parseInt(price) * parseInt(count);

    this._costs[$basketBlock.data('order-id')] = cost;

    $basketBlock
      .children('.cost')
      .children('span')
      .text(cost + ' руб');

    this.calculateSummaryPrice();
  },

  calculateSummaryPrice: function () {
    var totalPrice = 0;

    for (var i in this._costs) {
      totalPrice += this._costs[i];
    }

    this.$('.in-total > span > strong').text(totalPrice + ' руб');
  },

  onChangeSelect: function (e) {
    var $basketBlock = $(e.target).parents('.basket-block');
    var productModel = this.collection.get($basketBlock.data('order-id'));

    if (productModel) {
      productModel.set({
        weight: $basketBlock.find('#weight-selector').val(),
        count: $basketBlock.find('#count-selector').val()
      });

      productModel.save();
    }

    this.calculateOrderPrice($basketBlock);
  },

  redrawButton: function () {
    var $button = this.$('.in-total > a');

    if (this.collection.length == 0) {
      $button.hide();
    } else {
      $button.show();
    }
  }

});
