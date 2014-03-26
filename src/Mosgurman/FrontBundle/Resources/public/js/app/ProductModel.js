/**
 * Created by Yury Smidovich (Stmol)
 * Date: 15.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */
'use strict';

var MGApp = MGApp || {};

MGApp.ProductModel = Backbone.Model.extend({
  defaults: {
    count: 0
  }
});

MGApp.ProductCollection = Backbone.Collection.extend({
  model: MGApp.ProductModel
});
