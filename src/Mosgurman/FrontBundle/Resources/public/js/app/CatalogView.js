/**
 * Created by Yury Smidovich (Stmol)
 * Date: 15.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */
'use strict';

var MGApp = MGApp || {};

MGApp.CatalogView = Backbone.View.extend({

  events: {
    'click .drop>ul>li>a': 'onProductCountClick'
  },

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addProductToCart);
  },

  onProductCountClick: function (e) {
    e.preventDefault();

    if (this.collection.length > 50) {
      return;
    }

    var $target = $(e.target);

    this.collection.add({
      item: $target.parents('ul').data('product-id'),
      count: $target.parent().index() + 1,
      weight: $target.parents('ul').data('product-weigth')
    });
  },

  addProductToCart: function (model) {
    model.save();
    this.incrementProductCount();
  },

  incrementProductCount: function () {
    var count = parseInt($('.cart > .number > a').text());
    $('.cart > .number > a').text(count + 1);
  }

});
