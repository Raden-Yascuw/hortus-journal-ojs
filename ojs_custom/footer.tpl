{**
 * templates/frontend/components/footer.tpl
 * Green Academic Pro OJS Sidebar & Footer (inspired by inspo journal.png)
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		<div class="pkp_structure_sidebar left hj_sidebar_stack" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">

			{* Card 1: Make Submission Card (matching inspo journal.png) *}
			<div class="hj_sb_card hj_sb_make_submission">
				<a href="{url page="about" op="submissions"}" class="hj_make_sub_link">
					<svg class="hj_make_sub_icon" viewBox="0 0 48 48" width="44" height="44" fill="none" stroke="#14532D" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
						<path d="M28 6H12a4 4 0 0 0-4 4v28a4 4 0 0 0 4 4h16"/>
						<polyline points="28 6 28 14 36 14"/>
						<line x1="14" y1="18" x2="26" y2="18"/>
						<line x1="14" y1="24" x2="24" y2="24"/>
						<line x1="14" y1="30" x2="20" y2="30"/>
						<circle cx="33" cy="33" r="9" fill="#ECFDF5" stroke="#14532D" stroke-width="2.5"/>
						<polyline points="29 33 32 36 37 30" stroke="#15803D" stroke-width="2.5"/>
					</svg>
					<span class="hj_make_sub_text">Make Submission</span>
				</a>
			</div>

			{* Card 2: Quick Navigation Menu List (matching inspo journal.png) *}
			<nav class="hj_sb_card hj_sb_menu_list" aria-label="Journal Quick Links">
				<a href="{url page="about"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">◎</span>
					<span class="hj_sb_label">Focus &amp; scopes</span>
				</a>
				<a href="{url page="about" op="submissions"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">☑</span>
					<span class="hj_sb_label">Submission</span>
				</a>
				<a href="{url page="about" op="submissions"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">📄</span>
					<span class="hj_sb_label">Manuscript template</span>
				</a>
				<a href="{url page="about"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">❐</span>
					<span class="hj_sb_label">Publication ethics</span>
				</a>
				<a href="{url page="about" op="submissions"}" class="hj_sb_menu_item hj_sb_menu_active">
					<span class="hj_sb_icon">🛡</span>
					<span class="hj_sb_label">Plagiarism</span>
				</a>
				<a href="{url page="about" op="editorialTeam"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">👥</span>
					<span class="hj_sb_label">Editorial team</span>
				</a>
				<a href="{url page="about"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">品</span>
					<span class="hj_sb_label">Indexing</span>
				</a>
				<a href="{url page="issue" op="archive"}" class="hj_sb_menu_item">
					<span class="hj_sb_icon">📊</span>
					<span class="hj_sb_label">Statistics</span>
				</a>
			</nav>

			{* Card 3: Meet Our Editorial Team (matching inspo journal.png with the 4 team members) *}
			<div class="hj_sb_card hj_sb_editorial_card">
				<h3 class="hj_sb_ed_title">Meet Our Editorial Team</h3>
				<div class="hj_sb_ed_list">
					<div class="hj_sb_ed_item">
						<div class="hj_sb_avatar" style="background: linear-gradient(135deg, #14532D, #16A34A);">LA</div>
						<div class="hj_sb_ed_info">
							<div class="hj_sb_ed_name">Lidya Amalia Rahmania, S.Kom, M.Kom</div>
							<div class="hj_sb_ed_role">Pemimpin Redaksi</div>
							<div class="hj_sb_ed_aff">Universitas Negeri Malang</div>
							<div class="hj_sb_ed_id">🎓 Editor-in-Chief</div>
						</div>
					</div>
					<div class="hj_sb_ed_item">
						<div class="hj_sb_avatar" style="background: linear-gradient(135deg, #065F46, #10B981);">MY</div>
						<div class="hj_sb_ed_info">
							<div class="hj_sb_ed_name">Mohammad Yanuar Rizky</div>
							<div class="hj_sb_ed_role">Journal Manager &amp; Managing Editor</div>
							<div class="hj_sb_ed_aff">Universitas Negeri Malang</div>
							<div class="hj_sb_ed_id">🎓 250911718423</div>
						</div>
					</div>
					<div class="hj_sb_ed_item">
						<div class="hj_sb_avatar" style="background: linear-gradient(135deg, #166534, #22C55E);">ND</div>
						<div class="hj_sb_ed_info">
							<div class="hj_sb_ed_name">Nirmala Dwi Lestari</div>
							<div class="hj_sb_ed_role">Section Editors</div>
							<div class="hj_sb_ed_aff">Universitas Negeri Malang</div>
							<div class="hj_sb_ed_id">🎓 250911723861</div>
						</div>
					</div>
					<div class="hj_sb_ed_item">
						<div class="hj_sb_avatar" style="background: linear-gradient(135deg, #115E59, #14B8A6);">NS</div>
						<div class="hj_sb_ed_info">
							<div class="hj_sb_ed_name">Nayla Syukurillah</div>
							<div class="hj_sb_ed_role">Layout Editor, Copyeditor &amp; Production Team</div>
							<div class="hj_sb_ed_aff">Universitas Negeri Malang</div>
							<div class="hj_sb_ed_id">🎓 250911721564</div>
						</div>
					</div>
				</div>
			</div>

		</div><!-- pkp_sidebar.left -->
	{/if}
</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer">

		{if $pageFooter}
			<div class="pkp_footer_content">
				{$pageFooter}
			</div>
		{/if}

		<div class="pkp_brand_footer" role="complementary">
			<a href="{url page="about" op="aboutThisPublishingSystem"}">
				<img alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
			</a>
		</div>
	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
