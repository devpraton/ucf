
OUTPUT   := out
SRCS     := spec.tex
PDFS     := $(patsubst %.tex,out/%.pdf,$(SRCS))

all: pdf_target

out_dir:
	@mkdir -p $(OUTPUT)

$(OUTPUT)/%.pdf: %.tex spec.cls | out_dir
	@tectonic -Z shell-escape $< -o out/
	@echo "GEN $@"

clean:
	@rm -rf $(OUTPUT)
	@echo "CLEAN"

pdf_target: $(PDFS) | out_dir
