const Recipe = require('../models/Recipe');

module.exports = {
    onlyUsers(req, res, next) {
        if(!req.session.userId) return res.render('admin/session/login') 
        next()
    },

    async ownersAndAdmin(req, res, next) {
        if(!req.session.userId) return res.render('admin/session/login')

        let id = req.params.id;
        if(!id) id = req.body.id;

        const results = await Recipe.find(id);

        const recipe = results.rows[0].user_id;
        
        if(req.session.userId && recipe != req.session.userId && req.session.admin == false)
            return res.redirect('/')
        next()
    },

    async onlyAdmin(req, res, next) {
        if(!req.session.userId) return res.render('admin/session/login') 
        
        if (req.session.userId && req.session.admin == false) return res.redirect('/');
        next()
    }
}