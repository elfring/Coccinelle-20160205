# This file is part of Coccinelle, licensed under the terms of the GPL v2.
# See copyright.txt in the Coccinelle source code for more information.
# The Coccinelle source code can be obtained at http://coccinelle.lip6.fr

include $(abs_top_srcdir)/common_rules.make

x_modules_without_mli_source_dir::=$(abs_top_srcdir)/$(TARGET)/
x_modules_without_mli_ml_sources::=$(addprefix $(x_modules_without_mli_source_dir),$(SRC))
x_modules_without_mli_sources::=$(wildcard $(x_modules_without_mli_source_dir)*.mli)
x_modules_without_mli::=$(filter-out $(basename $(x_modules_without_mli_sources)),\
$(basename $(x_modules_without_mli_ml_sources)))
modules_without_mli::=$(subst $(x_modules_without_mli_source_dir),,$(x_modules_without_mli))
ifeq ($(MAKE_RESTARTS),)
$(info $(sort $(modules_without_mli)))
$(info $(words $(modules_without_mli)) modules without mli files)
endif

$(addsuffix .cmo,$(modules_without_mli)): %.cmo: %.ml
	$(OCAMLC_CMD) -c $<

$(addsuffix .cmx,$(modules_without_mli)): %.cmx: %.ml
	$(OCAMLOPT_CMD) -c $<
