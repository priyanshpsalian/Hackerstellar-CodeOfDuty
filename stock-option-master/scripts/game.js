/*
 * Stock Option (game for HappyFunTimes)
 * Based on "Simple" example by Greg Tavares (MIT-like license)
 *
 * Copyright 2015, Christiaan Janssen.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Christiaan Janssen, nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*  COPYRIGHT NOTICE OF THE ORIGINAL GAME BELOW */

/*
 * Copyright 2014, Gregg Tavares.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Gregg Tavares. nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
// Require will call this with GameServer, GameSupport, and Misc once
// gameserver.js, gamesupport.js, and misc.js have loaded.

// Start the main app logic.
requirejs([
    'hft/gameserver',
    'hft/gamesupport',
    'hft/misc/misc',
  ], function(GameServer, GameSupport, Misc) {

  var elementCache = {
    rank : document.getElementById("rank"),
    stats: document.getElementById("stats"),
    timerAmount : document.getElementById("timerAmount"),
    timerText : document.getElementById("timerTxt"),
    timerContainer : document.getElementById("timerContainer"),
    graph : document.getElementById("graph"),
  };
  var ctx = elementCache.graph.getContext("2d");

  var players = [];

  var gameData = {
    priceStory : [],
    currentPrice : 100,
  };
  var globals = {
      rankDirty : true,
      priceChanged : true,
      playing: false,

      totalTime: 80,
      explicitStartTime : 5,
      autoStartTime : 15,
      preTime: 15,

      maxStoryLen:1024,
      skip:0,
      skipStep:3,
  };
  Misc.applyUrlSettings(globals);


  ///////////////// PLAYER
  var Player = function(netPlayer, name) {
    this.netPlayer = netPlayer;
    this.name = name;
    this.cash = 1000;
    this.stock = 10;
    this.color="#fff";
    netPlayer.addEventListener('disconnect', Player.prototype.disconnect.bind(this));
    netPlayer.addEventListener('buy', Player.prototype.buyStock.bind(this));
    netPlayer.addEventListener('sell', Player.prototype.sellStock.bind(this));
    netPlayer.addEventListener('color', Player.prototype.setColor.bind(this));
    netPlayer.addEventListener('setName', Player.prototype.setName.bind(this));

    this.updateStats();
    this.netPlayer.sendCmd('updateprice', { currentPrice: gameData.currentPrice });

    globals.rankDirty = true;

  };

  Player.prototype.disconnect = function() {
    globals.rankDirty = true;
    for (var ii = 0; ii < players.length; ++ii) {
      var player = players[ii];
      if (player === this) {
        players.splice(ii, 1);
        return;
      }
    }
  };

  Player.prototype.buyStock = function(cmd) {
    if (!globals.playing) return
    if (this.cash >= gameData.currentPrice) {
        globals.rankDirty = true;
        this.cash -= gameData.currentPrice;
        this.stock++;
        gameData.currentPrice ++;
        globals.priceChanged = true;
        this.updateStats();
    }
  }

  Player.prototype.sellStock = function(cmd) {
    if (!globals.playing) return
    if (this.stock > 0) {
      globals.rankDirty = true;
      this.cash += gameData.currentPrice
      this.stock--;
      if (gameData.currentPrice >= 1) {
        gameData.currentPrice --;
        globals.priceChanged = true;
      }
      this.updateStats();
    }
  }

  Player.prototype.setColor = function(cmd) {
    this.color = cmd.color;
    globals.rankDirty = true;
  };

  Player.prototype.setName = function(cmd) {
    this.name = cmd.name;
    globals.rankDirty = true;
  }

  Player.prototype.updateStats = function() {
    this.netPlayer.sendCmd('stats', {
      cash : this.cash,
      stock : this.stock,
    });
  }
  ///////////////// PLAYER

  ///////////////// GAME
  var server = new GameServer();
  GameSupport.init(server, globals);

  // A new player has arrived.
  server.addEventListener('playerconnect', function(netPlayer, name) {
    globals.rankDirty = true;
    players.push(new Player(netPlayer, name));
    if (players.length >= 2 && !globals.playing && globals.startDate === undefined) {
      globals.preTime = globals.autoStartTime;
      prepareGame();
    }
  });


  var sortPlayers = function() {
    if (!globals.rankDirty) return;
    globals.rankDirty = false;
    players.sort(function(a,b) { return a.cash < b.cash })
    elementCache.rank.innerHTML = ""; // clear

    var addCol = function(tr, txt, w) {
        var td = document.createElement('td');
        var style = "text-align:center;"
        if (w !== undefined) {
          style += "width:"+w+"px;";
        }
        td.style = style;
        td.appendChild(document.createTextNode(txt))
        tr.appendChild(td)
    }

    var tbl = document.createElement('table');
    var tr = document.createElement('tr');
    tr.style = "border-style:solid;border-color:#000;border-width:thin;"
    addCol(tr, "RANK", 50);
    addCol(tr, "NAME", 200);
    addCol(tr, "CASH", 130);
    addCol(tr, "STOCK", 130);
    tbl.appendChild(tr);

    for (var i = 0; i < players.length; i++) {
        var tr = document.createElement('tr');
        tr.style = "background-color:"+players[i].color+";color:white;"
        addCol(tr, i+1, 50)
        addCol(tr, players[i].name+"     ", 200)
        addCol(tr, players[i].cash + " € ", 130)
        addCol(tr, players[i].stock + " u ", 130)
        tbl.appendChild(tr);
    }
    elementCache.rank.appendChild(tbl)
  };

  var updatePrice = function() {
    elementCache.stats.innerHTML = gameData.currentPrice;

  };

  var updatePlayers = function() {
    if (!globals.priceChanged) return;
    globals.priceChanged = false;
    var priceObj = {
        currentPrice: gameData.currentPrice,
      };
    for (var i = 0; i < players.length; i++) {
      players[i].netPlayer.sendCmd('updateprice', priceObj);
    }
  }

  var getTime = function() { return (new Date()).getTime(); }

  var updateTimer = function() {
    if (globals.startDate !== undefined) {
      var restTime = globals.startDate - getTime();
      if (restTime > 0) {


      } else {
        globals.endDate = globals.startDate + globals.totalTime * 1000;
        globals.startDate = undefined;
        restartGame();
      }

      elementCache.timerAmount.innerHTML = Math.ceil(restTime/1000);

    }

    if (globals.endDate !== undefined) {
      var restTime = globals.endDate - getTime();
      if (restTime < 0) {
        restTime = 0;
        globals.endDate = undefined;
        globals.playing = false;
        if (players.length >= 2) {
          globals.preTime = globals.autoStartTime;
          prepareGame();
        }
      }

      elementCache.timerAmount.innerHTML = Math.ceil(restTime/1000);
    }
  }

  var render = function() {
    updatePrice();
    sortPlayers();
    updatePlayers();

    updateTimer();
    updateGraph();
  };

  var restartGame = function() {
    for (var i = 0; i < players.length; i++) {
      players[i].cash = 1000;
      players[i].stock = 10;
      players[i].updateStats();
    }
    gameData.currentPrice = 100;
    globals.rankDirty = true;
    globals.priceChanged = true;
    sortPlayers();
    updatePlayers();
    updatePrice();
    resetGraph();
    drawEmptyGraph();
    updateGraph();

    elementCache.timerText.innerHTML = "Time left:"
    elementCache.timerContainer.style="color:#000;"
    globals.playing = true
  }

  var prepareGame = function() {
    globals.startDate = getTime() + globals.preTime * 1000;
    globals.endDate = undefined;
    elementCache.timerText.innerHTML = "Game starting in:"
    elementCache.timerContainer.style="color:#F00;"
    globals.playing = false
  }

  // restart
  window.addEventListener("keydown", function(event) {
    if (event.keyCode == 32) {
      globals.preTime = globals.explicitStartTime;
      restartGame();
      prepareGame();
    }
  } );
  ///////////////// GAME


  ///////////////// GRAPH
  var resetGraph = function() {
    var graph = elementCache.graph;
    ctx.fillStyle="#ffffff";
    ctx.fillRect(0,0,graph.width,graph.height)
    gameData.priceStory = [];
    gameData.maxPrice = 120
    gameData.minPrice = 80
    globals.skip = 0
  }

  var drawEmptyGraph = function() {
    // updatePrice
    var graph = elementCache.graph;
    var maxPrice = gameData.maxPrice * 1.05
    var minPrice = gameData.minPrice / 1.05
    var priceDiff = Math.max(maxPrice-minPrice, 1)
    var border = 40
    var cy = graph.height

    ctx.fillStyle="#ffffff";
    ctx.fillRect(0,0,graph.width,cy)

    ctx.strokeStyle="#000"
    ctx.setLineDash([5])
    ctx.beginPath();
    for (var yy=cy/10; yy<cy; yy+=cy/5) {
      ctx.moveTo(border,yy)
      ctx.lineTo(graph.width,yy)

    }
    ctx.stroke();
    ctx.setLineDash([])

    // values
    ctx.fillStyle="#000"
    var pra = function(pr) { return (1-pr/cy) * priceDiff + minPrice; }
    for (var yy=cy/10; yy<cy; yy+=cy/5) {
      ctx.fillText(Math.floor(pra(yy)) + " €", 5, yy + 4)
    }

  }

  var updateGraph = function() {
    if (!globals.playing) return;

    globals.skip-= 1;
    if (globals.skip <= 0) {
      globals.skip += globals.skipStep
    } else {
      return;
    }


    // updatePrice
    gameData.priceStory.push(gameData.currentPrice)
    if (gameData.currentPrice > gameData.maxPrice) gameData.maxPrice = gameData.currentPrice;
    if (gameData.currentPrice < gameData.minPrice) gameData.minPrice = gameData.currentPrice;
    if (gameData.priceStory.length > globals.maxStoryLen) {
        gameData.priceStory.splice(0,gameData.priceStory.length - globals.maxStoryLen);
    }

    var maxPrice = gameData.maxPrice * 1.05
    var minPrice = gameData.minPrice / 1.05
    var priceDiff = Math.max(maxPrice-minPrice, 1)
    var border = 40
    var ix = (graph.width-border) / globals.maxStoryLen
    var cy = graph.height

    drawEmptyGraph()

    var pry = function(pr) { return cy * (1 - (pr-minPrice)/priceDiff) }

    ctx.strokeStyle="#ff0000"
    ctx.beginPath();
    ctx.moveTo(border,pry(gameData.priceStory[0]));
    for (var i=1; i<gameData.priceStory.length; i++) {
        ctx.lineTo(i * ix + border, pry(gameData.priceStory[i]));
    }
    ctx.stroke();

  }
  ///////////////// GRAPH


  ///////////////////// FINAL INITIALIZATION
  resetGraph();
  drawEmptyGraph();
  GameSupport.run(globals, render);
});


