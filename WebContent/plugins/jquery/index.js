var TxtRotate = function(el, toRotate, period) {
			this.toRotate = toRotate;
			this.el = el;
			this.loopNum = 0;
			this.period = parseInt(period, 10) || 2000;
			this.txt = "";
			this.tick();
			this.isDeleting = false;
		};

		TxtRotate.prototype.tick = function() {
			var i = this.loopNum % this.toRotate.length;
			var fullTxt = this.toRotate[i];

			if (this.isDeleting) {
				this.txt = fullTxt.substring(0, this.txt.length - 1);
			} else {
				this.txt = fullTxt.substring(0, this.txt.length + 1);
			}

			this.el.innerHTML = '<span class="wrap">' + this.txt + "</span>";

			var that = this;
			var delta = 300 - Math.random() * 100;

			if (this.isDeleting) {
				delta /= 2;
			}

			if (!this.isDeleting && this.txt === fullTxt) {
				delta = this.period;
				this.isDeleting = true;
			} else if (this.isDeleting && this.txt === "") {
				this.isDeleting = false;
				this.loopNum++;
				delta = 500;
			}

			setTimeout(function() {
				that.tick();
			}, delta);
		};

		window.onload = function() {
			var elements = document.getElementsByClassName("txt-rotate");
			for (var i = 0; i < elements.length; i++) {
				var toRotate = elements[i].getAttribute("data-rotate");
				var period = elements[i].getAttribute("data-period");
				if (toRotate) {
					new TxtRotate(elements[i], JSON.parse(toRotate), period);
				}
			}
			// INJECT CSS
			var css = document.createElement("style");
			css.type = "text/css";
			css.innerHTML = ".txt-rotate > .wrap { border-right: 0.08em solid #666 }";
			document.body.appendChild(css);
		};
		
		var d1 = document.getElementById("salles1");
		var d2 = document.getElementById("salles2");
		var d3 = document.getElementById("salles3");
		var d4 = document.getElementById("salles4");
		d1.style.display = "block";
		d2.style.display = "none";
		d3.style.display = "none";
		d4.style.display = "none";
		function sample(value) {
			if (value == "Pavillon H") {
				d1.style.display = "block";
				d2.style.display = "none";
				d3.style.display = "none";
				d4.style.display = "none";
			} else if (value == "Pavillon F") {
				d1.style.display = "none";
				d2.style.display = "block";
				d3.style.display = "none";
				d4.style.display = "none";
			} else if (value == "Pavillon K") {
				d1.style.display = "none";
				d2.style.display = "none";
				d3.style.display = "block";
				d4.style.display = "none";
			} else if (value == "Espace Amphis") {
				d1.style.display = "none";
				d2.style.display = "none";
				d3.style.display = "none";
				d4.style.display = "block";
			}
		}