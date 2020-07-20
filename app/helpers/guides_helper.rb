module GuidesHelper
    def show_guide_link(guide)
        link_to guide.title, guide_path(guide)
    end
end