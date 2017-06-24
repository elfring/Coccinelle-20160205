# This file is part of Coccinelle, licensed under the terms of the GPL v2.
# See copyright.txt in the Coccinelle source code for more information.
# The Coccinelle source code can be obtained at http://coccinelle.lip6.fr

define rule_pair =
$(1:.ml=.cmo): $(1)
	$$(OCAMLC_CMD) -c $$<

$(1:.ml=.cmx): $(1)
	$$(OCAMLOPT_CMD) -c $$<
endef

$(foreach x,$(SRC_without_mli),$(eval $(call rule_pair,$(x))))
