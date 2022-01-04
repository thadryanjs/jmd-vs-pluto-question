### A Pluto.jl notebook ###
# v0.17.4

using Markdown
using InteractiveUtils

# ╔═╡ 4b5e6df6-6d78-11ec-3571-5579a0ed4c26
begin
	import Pkg
	Pkg.activate(Base.current_project())
	
	using DataFrames
	using Statistics
	using Query
end

# ╔═╡ 4b5e6dd6-6d78-11ec-0d69-d7c34c8ee9fc
html"""
	<div>Happy holiday! Remember to take care of yourself and your loved ones!</div>
<div id="snow"></div>
<style>
	body:not(.disable_ui):not(.more-specificity) {
        background-color:#e9ecff;
    }
	pluto-output{
		border-radius: 0px 8px 0px 0px;
        background-color:#e9ecff;
	}
	#snow {
        position: fixed;
    	top: 0;
    	left: 0;
    	right: 0;
    	bottom: 0;
    	pointer-events: none;
    	z-index: 1000;
	}
</style>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<script>
        setTimeout(() => window.particlesJS("snow", {
            "particles": {
                "number": {
                    "value": 70,
                    "density": {
                        "enable": true,
                        "value_area": 800
                    }
                },
                "color": {
                    "value": "#ffffff"
                },
                "opacity": {
                    "value": 0.7,
                    "random": false,
                    "anim": {
                        "enable": false
                    }
                },
                "size": {
                    "value": 5,
                    "random": true,
                    "anim": {
                        "enable": false
                    }
                },
                "line_linked": {
                    "enable": false
                },
                "move": {
                    "enable": true,
                    "speed": 5,
                    "direction": "bottom",
                    "random": true,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": true,
                        "rotateX": 300,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "events": {
                    "onhover": {
                        "enable": false
                    },
                    "onclick": {
                        "enable": false
                    },
                    "resize": false
                }
            },
            "retina_detect": true
        }), 3000);
	</script>
"""


# ╔═╡ 648ec6ad-4cc8-480e-87a5-f4972f44fe98
begin
	A = [12.6, 12, 11.8, 11.9, 13, 12.5, 14]
	B = [10, 10.2, 10, 12, 14, 13]
	C = [10.1, 13, 13.4, 12.9, 8.9, 10.7, 13.6, 12]
	
	allScores = [A; B; C]
	
	
	groups = [repeat(["A"], length(A)); repeat(["B"], length(B));
	          repeat(["C"], length(C))]
	
	df = DataFrame(group = groups, score = allScores)
	
	dGroupMeans = df |>
		@groupby(_.group) |>
		@map({group = key(_), score_mean = mean(_.score)}) |>
		@orderby(_.score_mean)
	
	dGroupMeans |>
		@filter(_.group == "B") |>
		@select(:score_mean)
end

# ╔═╡ Cell order:
# ╟─4b5e6dd6-6d78-11ec-0d69-d7c34c8ee9fc
# ╠═4b5e6df6-6d78-11ec-3571-5579a0ed4c26
# ╠═648ec6ad-4cc8-480e-87a5-f4972f44fe98
