mod_blocklistd.la: mod_blocklistd.slo
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version  mod_blocklistd.lo
DISTCLEAN_TARGETS = modules.mk
shared =  mod_blocklistd.la
