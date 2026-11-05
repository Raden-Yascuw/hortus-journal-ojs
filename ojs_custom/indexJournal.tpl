{**
 * templates/frontend/pages/indexJournal.tpl
 * Green Academic Pro OJS Journal Index Page (inspired by inspo journal.png)
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal hj_main_card">

	{call_hook name="Templates::Index::journal"}

	{* Top Split: 3D Standing Book Cover + Journal Description *}
	<section class="hj_desc_split">
		<div class="hj_book_col">
			<img src="{$publicFilesDir}/book_3d_hortus.png" alt="Hortus Journal 3D Cover" class="hj_book_3d_img" />
		</div>
		<div class="hj_desc_col">
			<h2 class="hj_desc_heading">Journal Description</h2>
			<p class="hj_desc_prose">
				<strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> (<em>Hortus J.</em> | p-ISSN: 2988-7401 | e-ISSN: 2988-741X) takes open access scholarly communication in tropical plantation and agro-industrial sciences to a modern standard. Published twice a year (June and December) by Departemen Agrosains &amp; UPT Perpustakaan Universitas Negeri Malang, our journal implements a rigorous <strong>Double-Blind Peer Review</strong> process (2–4 weeks SLA), <strong>Zero APC (Diamond Open Access)</strong> under CC BY 4.0, and full metadata optimization for Google Scholar, DOAJ, SINTA, and Crossref DOI integration.
				<a href="{url page="about"}" class="hj_detail_link">Click here for more detail</a>
			</p>
		</div>
	</section>

	{* 2x4 Indexing & Academic Partner Badges Grid (matching inspo journal.png) *}
	<section class="hj_indexing_grid" aria-label="Indexing and Abstracting">
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_road">R<span class="hj_idx_globe">◎</span>AD</span>
			<span class="hj_idx_sub">DIRECTORY OF OPEN ACCESS<br/>SCHOLARLY RESOURCES</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_dim_icon">❖</span>
			<span class="hj_idx_dim_text">Dimensions</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_cr_icon">▰</span>
			<span class="hj_idx_cr_text">Crossref</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_wc_icon">🌀</span>
			<span class="hj_idx_wc_text"><small>OCLC</small><br/>WorldCat</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_ios_icon">▶</span>
			<span class="hj_idx_ios_text"><small>Indonesia</small><br/><strong>OneSearch</strong></span>
		</a>
		<a href="https://um.ac.id" target="_blank" rel="noopener" class="hj_idx_badge hj_idx_badge_dark">
			<span class="hj_idx_um_crest">🎓</span>
			<span class="hj_idx_um_text"><small>UNIVERSITAS NEGERI</small><br/>MALANG</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_doaj">DOAJ</span>
			<span class="hj_idx_sub">DIRECTORY OF<br/>OPEN ACCESS<br/>JOURNALS</span>
		</a>
		<a href="{url page="about"}" class="hj_idx_badge">
			<span class="hj_idx_gs"><span style="color:#4285F4">G</span><span style="color:#EA4335">o</span><span style="color:#FBBC05">o</span><span style="color:#4285F4">g</span><span style="color:#34A853">l</span><span style="color:#EA4335">e</span> <small style="color:#64748B;font-weight:500;">Scholar</small></span>
		</a>
	</section>

	<hr class="hj_section_divider" />

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<section class="cmp_announcements highlight_first">
			<a id="homepageAnnouncements"></a>
			<h2 class="hj_section_title">
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
				{else}
					<article class="obj_announcement_summary">
						<h4>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<div class="date">
							{$announcement->getDatePosted()|date_format:$dateFormatShort}
						</div>
					</article>
				{/if}
			{/foreach}
			</div><!-- .more -->
		</section>
	{/if}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
			<a id="homepageIssue"></a>
			<h2 class="hj_section_title">
				{translate key="journal.currentIssue"}
			</h2>
			<div class="current_issue_title">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
