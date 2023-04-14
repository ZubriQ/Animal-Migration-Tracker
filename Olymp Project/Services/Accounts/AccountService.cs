﻿using Olymp_Project.Helpers.Validators;
using Olymp_Project.Responses;
using System.Security.Claims;

namespace Olymp_Project.Services.Accounts
{
    public partial class AccountService : IAccountService
    {
        private readonly ChipizationDbContext _db;

        public AccountService(ChipizationDbContext db)
        {
            _db = db;
        }

        #region Get by id

        public async Task<IServiceResponse<Account>> GetAccountByIdAsync(int? accountId)
        {
            if (!IdValidator.IsValid(accountId))
            {
                return new ServiceResponse<Account>(HttpStatusCode.BadRequest);
            }

            if (await _db.Accounts.FindAsync(accountId) is not Account account)
            {
                return new ServiceResponse<Account>(HttpStatusCode.NotFound);
            }

            return new ServiceResponse<Account>(HttpStatusCode.OK, account);
        }

        #endregion

        #region Get by search parameters

        public IServiceResponse<ICollection<Account>> GetAccounts(AccountQuery query, Paging paging)
        {
            if (!PagingValidator.IsValid(paging))
            {
                return new CollectionServiceResponse<Account>(HttpStatusCode.BadRequest);
            }

            try
            {
                var filteredAccounts = GetAccountsWithFilter(query);
                var pagedAccounts = PaginateAccounts(filteredAccounts, paging);
                return new CollectionServiceResponse<Account>(HttpStatusCode.OK, pagedAccounts);
            }
            catch (Exception)
            {
                return new CollectionServiceResponse<Account>();
            }
        }

        private IQueryable<Account> GetAccountsWithFilter(AccountQuery filter)
        {
            string loweredFirstName = string.IsNullOrWhiteSpace(filter.FirstName) ? null! : filter.FirstName.ToLower();
            string loweredLastName = string.IsNullOrWhiteSpace(filter.LastName) ? null! : filter.LastName.ToLower();
            string loweredEmail = string.IsNullOrWhiteSpace(filter.Email) ? null! : filter.Email.ToLower();

            return GetFilteredAccounts(loweredFirstName, loweredLastName, loweredEmail);
        }

        private IQueryable<Account> GetFilteredAccounts(string? firstName, string? lastName, string? email)
        {
            return _db.Accounts
                .AsQueryable()
                .Where(a =>
                (firstName == null || a.FirstName.ToLower().Contains(firstName)) &&
                (lastName == null || a.LastName.ToLower().Contains(lastName)) &&
                (email == null || a.Email.ToLower().Contains(email)));
        }

        private List<Account> PaginateAccounts(IQueryable<Account> accounts, Paging paging)
        {
            return accounts
                .OrderBy(a => a.Id)
                .Skip(paging.From!.Value)
                .Take(paging.Size!.Value)
                .ToList();
        }

        #endregion

        #region Insert

        public async Task<IServiceResponse<Account>> InsertAccountAsync(AccountRequestDto request)
        {
            if (!AccountValidator.IsValid(request))
            {
                return new ServiceResponse<Account>(HttpStatusCode.BadRequest);
            }

            bool alreadyExists = await _db.Accounts.AnyAsync(a => a.Email ==  request.Email);
            if (alreadyExists)
            {
                return new ServiceResponse<Account>(HttpStatusCode.Conflict);
            }

            try
            {
                return await CreateAccountAnsSaveChangesAsync(request);
            }
            catch (Exception)
            {
                return new ServiceResponse<Account>();
            }
        }

        private async Task<IServiceResponse<Account>> CreateAccountAnsSaveChangesAsync(AccountRequestDto request)
        {
            var newAccount = CreateAccount(request);
            _db.Accounts.Add(newAccount);
            await _db.SaveChangesAsync();

            return new ServiceResponse<Account>(HttpStatusCode.Created, newAccount);
        }

        private Account CreateAccount(AccountRequestDto request)
        {
            return new Account()
            {
                FirstName = request.FirstName!,
                LastName = request.LastName!,
                Email = request.Email!,
                Role = request.Role!,
                Password = request.Password!
            };
        }

        #endregion

        #region Update

        public async Task<IServiceResponse<Account>> UpdateAccountAsync(
            int? accountId, AccountRequestDto request)
        {
            if (!IdValidator.IsValid(accountId) || !AccountValidator.IsValid(request))
            {
                return new ServiceResponse<Account>(HttpStatusCode.BadRequest);
            }

            if (await _db.Accounts.FindAsync(accountId) is not Account account)
            {
                return new ServiceResponse<Account>(HttpStatusCode.NotFound);
            }

            return await UpdateAccountAndSaveChangesAsync(account, request);
        }

        private async Task<IServiceResponse<Account>> UpdateAccountAndSaveChangesAsync(
            Account account, AccountRequestDto request)
        {
            account.FirstName = request.FirstName!;
            account.LastName = request.LastName!;
            account.Email = request.Email!;
            account.Password = request.Password!;
            account.Role = request.Role!;
            // TODO: in other method?
            _db.Accounts.Update(account);
            await _db.SaveChangesAsync();

            return new ServiceResponse<Account>(HttpStatusCode.OK, account);
        }

        #endregion

        #region Remove

        public async Task<HttpStatusCode> RemoveAccountAsync(int? accountId)
        {
            if (!IdValidator.IsValid(accountId) ||
                await _db.Animals.AnyAsync(a => a.ChipperId == accountId))
            {
                return HttpStatusCode.BadRequest;
            }

            if (await _db.Accounts.FindAsync(accountId) is not Account account)
            {
                return HttpStatusCode.NotFound;
            }

            try
            {
                return await RemoveAccount(account);
            }
            catch (Exception)
            {
                return HttpStatusCode.InternalServerError;
            }
        }

        private async Task<HttpStatusCode> RemoveAccount(Account account)
        {
            _db.Accounts.Remove(account);
            await _db.SaveChangesAsync();
            return HttpStatusCode.OK;
        }

        #endregion
    }
}
